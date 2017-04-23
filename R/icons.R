#' Create an icon
#'
#' Create an icon for use within a page. Icons can appear on their own, inside
#' of a button, or as an icon for a \code{\link{tabPanel}} within a
#' \code{\link{navbarPage}}.
#'
#' @param name Name of icon. Icons are drawn from the
#'   \href{http://fontawesome.io/icons/}{Font Awesome} libraries.
#'   Note that the "fa-" prefix should not be used
#'   in icon names (i.e. the "fa-calendar" icon should be referred to as
#'   "calendar")
#' @param class Additional classes to customize the style of the icon (see the
#'   \href{http://fontawesome.io/examples/}{usage examples} for details on
#'   supported styles).
#'
#' @return An icon element
#'
#' @seealso For lists of available icons, see
#'   \href{http://fontawesome.io/icons/}{http://fontawesome.io/icons/}
#'
#' @examples
#' icon("calendar")               # standard icon
#' icon("calendar", "fa-3x")      # 3x normal size
#'
#' # add an icon to a submit button
#' submitButton("Update View", icon = icon("refresh"))
#'
#' navbarPage("App Title",
#'   tabPanel("Plot", icon = icon("bar-chart-o")),
#'   tabPanel("Summary", icon = icon("list-alt")),
#'   tabPanel("Table", icon = icon("table"))
#' )
#' @export
icon <- function(name, class = NULL) {
  prefix <- "fa"

  # build the icon class (allow name to be null so that other functions
  # e.g. buildTabset can pass an explicit class value)
  iconClass <- ""
  if (!is.null(name))
    iconClass <- paste0(prefix, " ", prefix, "-", name)
  if (!is.null(class))
    iconClass <- paste(iconClass, class)

  iconTag <- tags$i(class = iconClass)

  # font-awesome needs an additional dependency
  htmlDependencies(iconTag) <- htmlDependency(
      "font-awesome", "4.7.0", c(href="shared/font-awesome"),
      stylesheet = "css/font-awesome.min.css"
  )

  iconTag
}

# Helper funtion to extract the class from an icon
iconClass <- function(icon) {
  if (!is.null(icon)) icon$attribs$class
}
