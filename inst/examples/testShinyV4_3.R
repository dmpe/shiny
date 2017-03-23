library(shinyV4)
library(datasets)

# Define UI for dataset viewer application
des1 <- fluidPage(

  # Application title.
  titlePanel("More Widgets"),

  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),

      numericInput("obs", "Number of observations to view:", 10),

      helpText("Note: while the data view will show only the specified",
               "number of observations, the summary will still be based",
               "on the full dataset."),

      actionButton("update", "Update View")
    ),

    mainPanel(
      h4("Summary"),
      verbatimTextOutput("summary"),

      h4("Observations"),
      tableOutput("view")
    )
  )
)


# Define server logic required to summarize and view the
# selected dataset
sPl <- function(input, output) {

  datasetInput <- eventReactive(input$update, {
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  }, ignoreNULL = FALSE)

  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })

  output$view <- renderTable({
    head(datasetInput(), n = isolate(input$obs))
  })
}

shinyApp(ui=des1, server=sPl)

