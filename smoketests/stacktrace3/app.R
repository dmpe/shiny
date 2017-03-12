library(shinyV4)

badfunc <- function() {
  stop("boom")
}

ui <- fluidPage(
)

server <- function(input, output, session) {
  on.exit(stopApp())
  badfunc()
}

shinyApp(ui, server)
