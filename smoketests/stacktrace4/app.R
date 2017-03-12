library(shinyV4)

badfunc <- function() {
  stop("boom")
}

ui <- function(req) {
  stopApp()
  badfunc()
}

server <- function(input, output, session) {
  on.exit(stopApp())
  badfunc()
}

shinyApp(ui, server)
