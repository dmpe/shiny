library(shinyV4)

baduicall <- function() {
  stopApp()
  stop("ui boom")
}

ui <- fluidPage(
  cardPanel(baduicall())
)
