## Introduction to Dash R sample program 2
## file: dash02.R
# Adapted from Dash help file
# Packages: dash, dashCoreComponents, dashHtmlComponents
# Dash layout simple barchart
# install.packages("dash")
# install.packages("dashCoreComponents")
# install.packages("dashHtmlComponents")

library(plotly)
library(RColorBrewer)
app <- Dash$new()

year <- c(1997, 1998, 1999, 2000, 2001, 2002, 2003,
          2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017)

Hongkonger <- c(0.359,
                0.348,
                0.375,
                0.370,
                0.314,
                0.299,
                0.300,
                0.270,
                0.244,
                0.236,
                0.235,
                0.200,
                0.312,
                0.304,
                0.408,
                0.364,
                0.365,
                0.413,
                0.383,
                0.383,
                0.381)

Chinese <- c(0.180,
             0.232,
             0.206,
             0.199,
             0.285,
             0.308,
             0.313,
             0.323,
             0.336,
             0.332,
             0.268,
             0.365,
             0.268,
             0.245,
             0.201,
             0.198,
             0.224,
             0.187,
             0.201,
             0.171,
             0.177)

hker <- data.frame(year, Hongkonger, Chinese)

app$layout(
  htmlDiv(
    dccGraph(
      figure = layout(
        add_trace(
          plot_ly(hker,
                  x = ~year,
                  y = ~Hongkonger,
                  type = "bar",
                  name = "Hongkonger",
                  marker = list(color = "steelblue")
          ),
          y = ~Chinese,
          name = "Chinese",
          marker = list(color = "red")
        ),
        yaxis = list(title = "Percentage"),
        xaxis = list(title = "Year"),
        barmode = "group",
        title="Hong Kong Identity"),
      style = list("height" = 300),
      id = "hongkonger"
    )
  )
)

app$run_server()
