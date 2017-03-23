library(shinyV4)
library(datasets)

# Define server logic required to summarize and view the selected
# dataset
ser <- function(input, output) {

  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })

  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })

  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
}

# Define UI for dataset viewer application
ui <- fluidPage(

  # Application title
  titlePanel("Shiny Text"),

  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),

      numericInput("obs", "Number of observations to view:", 10),
      helpText("Note: while the data view will show only the specified",
               "number of observations, the summary will still be based",
               "on the full dataset.")
    ),

    # Show a summary of the dataset and an HTML table with the
    # requested number of observations
    mainPanel(
      h4("Summary"),
      verbatimTextOutput("summary"),

      h4("Observations"),
      tableOutput("view")
    )
  )
)

shinyV4::shinyApp(ui, ser)
