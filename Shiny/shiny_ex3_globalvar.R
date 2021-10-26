# Example 3
# Shiny example: use global variables

library(shiny)
library(datasets)

# mtcars dataset: 
# mpg	Miles/(US) gallon
# cyl	Number of cylinders
# disp	Displacement (cu.in.)
# hp	Gross horsepower
# drat	Rear axle ratio
# wt	Weight (1000 lbs)
# qsec	1/4 mile time
# vs	V/S
# am	Transmission (0 = automatic, 1 = manual)
# gear	Number of forward gears
# carb	Number of carburetors



mpgData <- mtcars
# Data pre-processing ----
# Tweak the "am" variable to have nicer factor labels
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))


# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Horsepower"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:",
                  c("Cylinders" = "cyl",
                    "Transmission" = "am",
                    "Gears" = "gear")),
      
      # Input: Checkbox for whether outliers should be included ----
      checkboxInput("outliers", "Show outliers", TRUE)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      # Output: Plot of the requested variable against mpg ----
      plotOutput("hpPlot")
      
    )
  )
)

# Define server logic to plot various variables against hp ----
server <- function(input, output) {
  
  # Compute the formula text ----
  # This is in a reactive expression since it is shared by the
  # output$caption and output$hpPlot functions
  formulaText <- reactive({
    paste("hp ~", input$variable)
  })
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against hp ----
  # and only exclude outliers if requested
  output$hpPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = mpgData,
            outline = input$outliers,
            col = "#75AADB", pch = 19)
  })
  
}

# Create Shiny app ----
shinyApp(ui, server)
