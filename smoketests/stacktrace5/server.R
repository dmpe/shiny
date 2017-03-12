library(shinyV4)

badservercall <- function() {
  stop("server boom")
}

function(input, output, session) {
  on.exit(stopApp())
  badservercall()
}
