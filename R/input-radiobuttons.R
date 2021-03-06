#' Create radio buttons
#'
#' Create a set of radio buttons used to select an item from a list.
#'
#' If you need to represent a "None selected" state, it's possible to default
#' the radio buttons to have no options selected by using \code{selected =
#' character(0)}. However, this is not recommended, as it gives the user no way
#' to return to that state once they've made a selection. Instead, consider
#' having the first of your choices be \code{c("None selected" = "")}.
#'
#' @inheritParams textInput
#' @param choices List of values to select from (if elements of the list are
#'   named then that name rather than the value is displayed to the user). If
#'   this argument is provided, then \code{choiceNames} and \code{choiceValues}
#'   must not be provided, and vice-versa. The values should be strings; other
#'   types (such as logicals and numbers) will be coerced to strings.
#' @param selected The initially selected value (if not specified then defaults
#'   to the first value)
#' @param inline If \code{TRUE}, render the choices inline (i.e. horizontally)
#' @return A set of radio buttons that can be added to a UI definition.
#' @param choiceNames,choiceValues List of names and values, respectively, that
#'   are displayed to the user in the app and correspond to the each choice (for
#'   this reason, \code{choiceNames} and \code{choiceValues} must have the same
#'   length). If either of these arguments is provided, then the other
#'   \emph{must} be provided and \code{choices} \emph{must not} be provided. The
#'   advantage of using both of these over a named list for \code{choices} is
#'   that \code{choiceNames} allows any type of UI object to be passed through
#'   (tag objects, icons, HTML code, ...), instead of just simple text. See
#'   Examples.
#'
#' @family input elements
#' @seealso \code{\link{updateRadioButtons}}
#'
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'
#' ui <- fluidPage(
#'   radioButtons("dist", "Distribution type:",
#'                c("Normal" = "norm",
#'                  "Uniform" = "unif",
#'                  "Log-normal" = "lnorm",
#'                  "Exponential" = "exp")),
#'   plotOutput("distPlot")
#' )
#'
#' server <- function(input, output) {
#'   output$distPlot <- renderPlot({
#'     dist <- switch(input$dist,
#'                    norm = rnorm,
#'                    unif = runif,
#'                    lnorm = rlnorm,
#'                    exp = rexp,
#'                    rnorm)
#'
#'     hist(dist(500))
#'   })
#' }
#'
#' shinyApp(ui, server)
#'
#' ui <- fluidPage(
#'   radioButtons("rb", "Choose one:",
#'                choiceNames = list(
#'                  icon("calendar"),
#'                  HTML("<p style='color:red;'>Red Text</p>"),
#'                  "Normal text"
#'                ),
#'                choiceValues = list(
#'                  "icon", "html", "text"
#'                )),
#'   textOutput("txt")
#' )
#'
#' server <- function(input, output) {
#'   output$txt <- renderText({
#'     paste("You chose", input$rb)
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#' @export
radioButtons <- function(inputId, label, choices = NULL, selected = NULL,
  inline = FALSE, width = NULL, choiceNames = NULL, choiceValues = NULL) {

  args <- normalizeChoicesArgs(choices, choiceNames, choiceValues)

  selected <- restoreInput(id = inputId, default = selected)

  # default value if it's not specified
  selected <- if (is.null(selected)) args$choiceValues[[1]] else as.character(selected)

  if (length(selected) > 1) stop("The 'selected' argument must be of length 1")

  options <- generateOptions(inputId, selected, inline,
    'radio', args$choiceNames, args$choiceValues)

  divClass <- "shiny-input-radiogroup shiny-input-container"
  if (inline) divClass <- paste(divClass, "form-check-inline")

  tags$div(id = inputId,
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    class = divClass,
    controlLabel(inputId, label),
    options
  )
}
