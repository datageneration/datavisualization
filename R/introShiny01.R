## Introduction to R Shiny sample program 1
## file: introShiny01.R
## Adapted from Beeley, Chris and Shitalkumar R. Sukhdeve, 2018. Web application development 
## with R using Shiny (3rd ed.) Packt Publishing Ltd.
## Also, https://shiny.rstudio.com
# Packages:  shiny

# Formatting page using tags
require("shiny")
library(shiny)

# First component: User interface (ui)
ui <- fluidPage (
  tags$h1("Data Visualization App"), 
  tags$img(src = "https://karlho.com/img/KarlHoPic100.png"),
   # tags$hr(),
   # tags$br(),
  tags$h1(strong("Karl Ho")),
  tags$p(em("School of Economic, Political and Policy Sciences")),
  tags$a(em(href="https://utdallas.edu", "University of Texas at Dallas")),
  tags$a(href="https://karlho.com", "Karl Ho website"))

# Second component: server

server <- function(input , output){} 

# Calling the shinyapp

shinyApp(ui = ui , server = server)
