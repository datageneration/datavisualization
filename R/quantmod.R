install.packages("quantmod")
library(quantmod)
quantmod::getSymbols("TWTR", src="yahoo")
chartSeries(TWTR)
chartSeries(TWTR, type = c("auto", "candlesticks", "matchsticks", "bars","line"), subset='last 4 months',theme = "white")
barChart(TWTR,multi.col=TRUE,theme = 'white')
lineChart(TWTR,line.type = 'l', theme = 'white') # line, choices include l, h, c, b
lineChart(TWTR,line.type = 'h',theme = chartTheme('white', up.col='steelblue')) # histogram
candleChart(TWTR,subset = "2020-11/2021-01", multi.col=TRUE,theme = chartTheme('white'))
## grey => Open[t] < Close[t] and Op[t] < Cl[t-1]
## white => Op[t] < Cl[t] and Op[t] > Cl[t-1]
## red => Op[t] > Cl[t] and Op[t] < Cl[t-1]
## black => Op[t] > Cl[t] and Op[t] > Cl[t-1]