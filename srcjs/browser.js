var browser = (function() {

  var isQt = false;
  // For easy handling of Qt quirks using CSS
  if (/\bQt\//.test(window.navigator.userAgent)) {
    $(document.documentElement).addClass('qt');
    isQt = true;
  }

  // Enable special treatment for Qt 5 quirks on Linux
  if (/\bQt\/5/.test(window.navigator.userAgent) &&
      /Linux/.test(window.navigator.userAgent)) {
    $(document.documentElement).addClass('qt5');
  }

  // https://codepen.io/gapcode/pen/vEJNZN
  // https://stackoverflow.com/questions/33152523/how-do-i-detect-ie-and-edge-browser
  // Detect IE information
  var isIE = (document.documentMode || /Edge/.test(navigator.userAgent));

  function getIEVersion() {
    var ua = window.navigator.userAgent;

    var msie = ua.indexOf('MSIE ');
    if (msie > 0) {
     // IE 10 or older => return version number
     return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
     // IE 11 => return version number
     var rv = ua.indexOf('rv:');
     return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
     // Edge (IE 12+) => return version number
     return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }
    return null;
  }

  return {
    isQt: isQt,
    isIE: isIE,
    IEVersion: getIEVersion()
  };

})();
