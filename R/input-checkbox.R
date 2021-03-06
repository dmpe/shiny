#' Checkbox Input Control
#'
#' Create a checkbox that can be used to specify logical values.
#'
#' @inheritParams textInput
#' @param value Initial value (\code{TRUE} or \code{FALSE}).
#' @return A checkbox control that can be added to a UI definition.
#'
#' @family input elements
#' @seealso \code{\link{checkboxGroupInput}}, \code{\link{updateCheckboxInput}}
#'
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'
#' ui <- fluidPage(
#'   checkboxInput("somevalue", "Some value", FALSE),
#'   verbatimTextOutput("value")
#' )
#' server <- function(input, output) {
#'   output$value <- renderText({ input$somevalue })
#' }
#' shinyApp(ui, server)
#' }
#' @export
checkboxInput <- function(inputId, label, value = FALSE, width = NULL) {

  value <- restoreInput(id = inputId, default = value)

  inputTag <- tags$input(id = inputId, type="checkbox", class = "form-check-input", label)
  if (!is.null(value) && value)
    inputTag$attribs$checked <- "checked"

  div(class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    tags$label(class = "form-check-label", inputTag)
  )
}
