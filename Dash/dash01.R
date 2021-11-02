## Introduction to Dash R sample program 1
## file: dash01.R
# Adapted from Dash for R User Guide: https://dashr.plotly.com/layout
# Packages: dash, dashCoreComponents, dashHtmlComponents
# Dash layout simple scatterplot
# install.packages("dash")
# install.packages("dashCoreComponents")
# install.packages("dashHtmlComponents")

# load the dash packages
library(tidyverse)
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

# Create Dash app applying external stylesheet
app <- Dash$new(external_stylesheets = "https://codepen.io/chriddyp/pen/bWLwgP.css")

# Prepare data
hpi2016 <- read_csv("https://raw.githubusercontent.com/datageneration/datavisualization/master/data/hpi2016all.csv")

# For creating the function to plot data by Region
region <- unique(hpi2016$Region)

# Create data object
data_hpi2016 <- with(hpi2016,
                               lapply(region,
                                      function(reg) {
                                        list(
                                          x = GDPPC[region == reg],
                                          y = AverageLifeExpectancy[region == reg],
                                          opacity=0.7,
                                          text = Country[region == reg],
                                          mode = 'markers',
                                          name = reg,
                                          marker = list(size = 5,
                                                        line = list(width = 0.5, color = 'white'))
                                        )
                                      }
                               )
)

# Layout component

app$layout(
  htmlDiv(
    list(
      dccGraph(
        id = 'life-exp-vs-gdppc',
        figure = list(
          data =  data_hpi2016,
          layout = list(
            xaxis = list('type' = 'log', 'title' = 'GDP Per Capita'),
            yaxis = list('title' = 'Average Life Expectancy'),
            margin = list('l' = 40, 'b' = 40, 't' = 40, 'r' = 40),
            legend = list('x' = 0, 'y' = 1),
            hovermode = 'closest'
          )
        )
      )
    )
  )
)

# Run app and feed to local server
app$run_server()

