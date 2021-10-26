# Example 1
# First Shiny application demonstrates Shiny's automatic UI updates. 
# Move the *Number of bins* slider and notice how the `renderPlot` expression 
# is automatically re-evaluated when its dependant, `input$bins`, changes, 
# causing a histogram with a new number of bins to be rendered.
# Modified using class dataset called hkid
# Try loading your own dataset
# install.packages("foreign")
library(foreign)
library(shiny)

hkid <- read_csv("https://raw.githubusercontent.com/datageneration/datavisualization/master/data/hkid.csv")
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hong Kong Identity"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Hong Kong Identity Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- hkid$Hongkonger
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Hong Konger Identity",
         main = "Histogram of Hongkongers")
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
