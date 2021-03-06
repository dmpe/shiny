#' Create a numeric input control
#'
#' Create an input control for entry of numeric values
#'
#' @inheritParams textInput
#' @param min Minimum allowed value
#' @param max Maximum allowed value
#' @param step Interval to use when stepping between min and max
#' @return A numeric input control that can be added to a UI definition.
#'
#' @family input elements
#' @seealso \code{\link{updateNumericInput}}
#'
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'
#' ui <- fluidPage(
#'   numericInput("obs", "Observations:", 10, min = 1, max = 100),
#'   verbatimTextOutput("value")
#' )
#' server <- function(input, output) {
#'   output$value <- renderText({ input$obs })
#' }
#' shinyApp(ui, server)
#' }
#' @export
numericInput <- function(inputId, label, value, min = NA, max = NA, step = NA,
  width = NULL) {

  value <- restoreInput(id = inputId, default = value)

  # build input tag
  inputTag <- tags$input(id = inputId, type = "number", class="form-control",
                         value = formatNoSci(value))
  if (!is.na(min))
    inputTag$attribs$min = min
  if (!is.na(max))
    inputTag$attribs$max = max
  if (!is.na(step))
    inputTag$attribs$step = step

  div(class = "form-group shiny-input-container font-weight-bold",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    label %AND% tags$label(label, `for` = inputId),
    inputTag
  )
}
