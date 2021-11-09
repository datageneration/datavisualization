# Plotting time series (stock example)
# install.packages(c("quantmod", "ggplot2", "magrittr","broom"))
# lapply(c("quantmod", "ggplot2", "magrittr","broom"), require, character.only = TRUE)
library(quantmod)
library(ggplot2)
library(magrittr)
library(broom)

# Get Apple stock prices
getSymbols("AAPL", src="yahoo")

## Plotting multiple series using ggplot2

# Setting time period
start = as.Date("2020-10-01") 
end = as.Date("2021-11-02")

# Collect stock names from Yahoo Finance
getSymbols(c("AAPL", "FB", "TSM"), src = "yahoo", from = start, to = end)

# Prepare data as xts (time series object)
stocks = as.xts(data.frame(AAPL = AAPL[, "AAPL.Adjusted"], 
                           FB = FB[, "FB.Adjusted"], 
                           TSM = TSM[, "TSM.Adjusted"]))

# Index by date
names(stocks) = c("Apple", "Facebook", "Taiwan Semiconductor Manu.")
index(stocks) = as.Date(index(stocks))

# Plot
stocks_series = tidy(stocks) %>% 
  ggplot(aes(x=index,y=value, color=series)) + 
  geom_line(cex=1) +
  theme_bw()
stocks_series

stocks_series2 = tidy(stocks) %>% 
  ggplot(aes(x=index,y=value, color=series)) + 
  geom_line(cex=1) +
  theme_bw() +
  labs(title = "Daily Stock Prices, 10/1/2020 - 11/10/2020",
     subtitle = "End of Day Adjusted Prices",
     caption = "Source: Yahoo Finance") +
  xlab("Date") + ylab("Price") +
  scale_color_manual(values = c("steelblue", "red","purple")) +
  theme(text = element_text(family = "Palatino"), plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) +
  theme(legend.position="top")
stocks_series2
