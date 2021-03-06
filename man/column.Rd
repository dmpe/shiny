% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bootstrap-layout.R
\name{column}
\alias{column}
\title{Create a column within a UI definition}
\usage{
column(width, ..., offset = "")
}
\arguments{
\item{width}{The grid width of the column (must be between 1 and 12)}

\item{...}{Elements to include within the column}

\item{offset}{One of \code{ml-auto}, \code{ml-md-auto} or \code{mr-auto}}
}
\value{
A column that can be included within a
  \code{\link{fluidRow}} or \code{\link{fixedRow}}.
}
\description{
Create a column for use within a  \code{\link{fluidRow}} or
\code{\link{fixedRow}}
}
\examples{
## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  fluidRow(
    column(4,
      sliderInput("obs", "Number of observations:",
                  min = 1, max = 1000, value = 500)
    ),
    column(8,
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs))
  })
}

shinyApp(ui, server)



ui <- fluidPage(
  fluidRow(
    column(width = 4,
      "4"
    ),
    column(width = 3, offset = "mr-auto",
      "3 offset 2"
    )
  )
)
shinyApp(ui, server = function(input, output) { })
}
}
\seealso{
\code{\link{fluidRow}}, \code{\link{fixedRow}},
\url{https://getbootstrap.com/docs/4.0/layout/grid/#offsetting-columns}
}
