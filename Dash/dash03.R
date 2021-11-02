## Introduction to Dash R sample program 3
## file: dash03.R
# Adapted from Dash for R User Guide: https://dashr.plotly.com/basic-callbacks
# Packages: dash, dashCoreComponents, dashHtmlComponents
# Dash Callback slider
# install.packages("dash")
# install.packages("dashCoreComponents")
# install.packages("dashHtmlComponents")

# load the dash packages
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(gapminder)
gm = gapminder

# Create Dash app applying external stylesheet
app <- Dash$new(external_stylesheets = "https://raw.githubusercontent.com/datageneration/datavisualization/master/Dash/bWLwgP1.css")

# Prepare data
continents <- unique(gm$continent)
years <- unique(gm$year)

# dccSlider starts from 0;
app$layout(
  htmlDiv(
    list(
      dccGraph(id = 'graph-with-slider'),
      dccSlider(
        id = 'year-slider',
        min = 0,
        max = length(years) - 1,
        marks = years,
        value = 0
      )
    )
  )
)

app$callback(
  output = list(id='graph-with-slider', property='figure'),
  params = list(input(id='year-slider', property='value')),
  
  function(selected_year_index) {
    
    which_year_is_selected <- which(gm$year == years[selected_year_index + 1])
    
    traces <- lapply(continents,
                     function(cont) {
                       
                       which_continent_is_selected <- which(gm$continent == cont)
                       
                       gm_sub <- gm[intersect(which_year_is_selected, which_continent_is_selected), ]
                       
                       with(
                         gm_sub,
                         list(
                           x = gdpPercap,
                           y = lifeExp,
                           opacity=0.5,
                           text = country,
                           mode = 'markers',
                           marker = list(
                             size = 7,
                             line = list(width = 0.5, color = 'white')
                           ),
                           name = cont
                         )
                       )
                     }
    )
    
    list(
      data = traces,
      layout= list(
        xaxis = list(type = 'log', title = 'GDP Per Capita'),
        yaxis = list(title = 'Life Expectancy', range = c(20,90)),
        automargin = TRUE,
        margin = list(l = 40, b = 40, t = 40, r = 10),
        title="Gapminder: Income and Longevity",
        legend = list(x = 1, y = 0),
        hovermode = 'closest'
      )
    )
  }
)

app$run_server()
