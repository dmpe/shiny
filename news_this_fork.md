NEWS file for this fork
=======

### Breaking changes:

- Upgraded Bootstrap to v4 beta and many other libraries as well (as of August 2017).
  - Jquery to v3.2.1
  - Highlight to v9.12 (based on customized pack from <https://highlightjs.org/download/>)
  - Ion.rangeSlider to v2.2 <https://github.com/IonDen/ion.rangeSlider/releases>
  - DataTables to v1.10.15 <https://github.com/DataTables/DataTables/releases>
  - Bootstrap Datapicker to v1.7.1 <https://github.com/uxsolutions/bootstrap-datepicker/releases>
  - Selectize to v0.12.4. <https://github.com/selectize/selectize.js/releases>
  - Showdown to v1.7.2 <https://github.com/showdownjs/showdown/releases>
  - Strftime to v0.10 <https://github.com/samsonjs/strftime/releases>


### Changes to styles applied in (non-exhaustive):

- in `srcjs` folder:
  - `browser.js`

- in `R` folder:
  - `App.R`
  - `Bookmark-state.R`
  - `Bootstrap.R`
  - `Bootstrap-layout.R`
  - `Input-data.R`
  - `Input-file.R`
  - `Input-slider.R`
  - `Input-checkbox.R`
  - `jqueryui.R`
  - `modal.R`
  - `shinyUI.R`
  - `showcase.R`

- Notes:
  - Instead of using `flowLayout` by applying `shiny-flow-layout` CSS stylying, consider <https://getbootstrap.com/docs/4.0/layout/grid/#alignment>
  - `flexfill` doesnt need prefixes anymore due to bootstrap 4 itself. 
