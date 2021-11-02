## Introduction to Dash R sample program 0
## file: dash00.R
# Packages: dash, dashCoreComponents, dashHtmlComponents
#install.packages(c("dash","dashCoreComponents","dashHtmlComponents"))

# load the dash packages

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

# Apply CSS to layout
app <- Dash$new(external_stylesheets = "https://raw.githubusercontent.com/datageneration/datavisualization/master/Dash/bWLwgP1.css")

app$layout(
  htmlDiv(
    list(
      htmlH1('Comparing Dallas with Montr\U{00E9}al'), 
      htmlDiv(children = "Interactive bar chart"),
      dccGraph(
        id = 'bar-Dallas-Montreal',
        figure=list(
          data=list(
            list(
              x=list(1, 2, 3),
              y=list(4, 1, 2),
              type='bar',
              name='Dallas'
            ),
            list(
              x=list(1, 2, 3),
              y=list(2, 4, 5),
              type='bar',
              name='Montr\U{00E9}al'
            )
          ),
          layout = list(title='Dash app with barchart')
        )
      )
    )
  )
)

app$run_server()
