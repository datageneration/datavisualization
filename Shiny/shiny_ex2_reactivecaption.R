# Example 2
# This example demonstrates a core feature of Shiny: **reactivity**. 
# In the `server` function, a reactive called `datasetInput` is declared. 
# Notice that the reactive expression depends on the input expression `input$dataset`, 
# and that it's used by two output expressions: `output$summary` and `output$view`. 
# Try changing the dataset (using *Choose a dataset*) while looking at the reactive and then at the outputs; 
# you will see first the reactive and then its dependencies flash. 

# Notice also that the reactive expression doesn't just update whenever anything changes--only the inputs it depends on will trigger an update. 
# Change the "Caption" field and notice how only the `output$caption` expression is re-evaluated; the reactive and its dependents are left alone.

library(readr)
library(shiny)

# Be sure to set up directory for Shiny to read local data
setwd("yourdirectory")
# hkid <- read_csv("hkid.csv")
# CO2 <- read_csv("CO2.csv")
# hpi2016 <- read_csv("hpi2016.csv")
hkid <- read_csv("https://raw.githubusercontent.com/datageneration/datavisualization/master/data/hkid.csv")
CO2 <- read_csv("https://raw.githubusercontent.com/datageneration/datavisualization/master/data/CO2.csv")
hpi2016 <- read_csv("https://raw.githubusercontent.com/datageneration/datavisualization/master/data/hpi2016.csv")

# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Reactivity"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Text for providing a caption ----
      # Note: Changes made to the caption in the textInput control
      # are updated in the output area immediately as you type
      textInput(inputId = "caption",
                label = "Caption:",
                value = "Data Summary"),
      
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("Hong Kong Identity", "HPI 2016","CO2 emissions")),
    
      # Input: Numeric entry for number of obs to view ----
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   min=0,
                   value = 10)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption", container = span)),
      
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
  # By declaring datasetInput as a reactive expression we ensure
  # that:
  #
  # 1. It is only called when the inputs it depends on changes
  # 2. The computation and result are shared by all the callers,
  #    i.e. it only executes a single time
  datasetInput <- reactive({
    switch(input$dataset,
           "Hong Kong Identity" =hkid,
           "HPI 2016"=hpi2016,
           "CO2 emissions"=CO2)
      })
  
  # Create caption ----
  # The output$caption is computed based on a reactive expression
  # that returns input$caption. When the user changes the
  # "caption" field:
  #
  # 1. This function is automatically called to recompute the output
  # 2. New caption is pushed back to the browser for re-display
  #
  # Note that because the data-oriented reactive expressions
  # below don't depend on input$caption, those expressions are
  # NOT called when input$caption changes
  output$caption <- renderText({
    input$caption
  })
  
  # Generate a summary of the dataset ----
  # The output$summary depends on the datasetInput reactive
  # expression, so will be re-executed whenever datasetInput is
  # invalidated, i.e. whenever the input$dataset changes
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations ----
  # The output$view depends on both the databaseInput reactive
  # expression and input$obs, so it will be re-executed whenever
  # input$dataset or input$obs is changed
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  

}

# Create Shiny app ----
shinyApp(ui, server)
