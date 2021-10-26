# Example 4
# This example demonstrates output of dataset descriptives from R using the `renderPrint` 
# function in `server` and the `verbatimTextOutput` function in `ui`. 
# Descriptives of the dataset will be shown using R's built-in `summary` function. 

# Use preload function to load Shiny.  Be sure to run the preload.R.
library("shiny")
library("psych")
# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Dataset descriptives"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("Hong Kong Identity", "hpi2016dataonly","CO2 emissions")),
      
      # Input: Numeric entry for number of obs to view ----
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Verbatim text for data summary ----
      verbatimTextOutput("summary"),

      # Output: HTML table with requested number of observations ----
      tableOutput("view")
      
    )
  )
)

# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  
  # Return the requested dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "Hong Kong Identity" = hkid,
           "hpi2016dataonly"=hpi2016dataonly,
           "CO2 emissions"=CO2)
  })
  
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations ----
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
