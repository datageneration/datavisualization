# Plotting time series (Nathan Yau example2)
# Scatterplot
subscribers <-
  read.csv("http://datasets.flowingdata.com/flowingdata_subscribers.csv",
           sep=",", header=TRUE)

plot(subscribers$Subscribers)

# Plot with Y limit 
plot(subscribers$Subscribers, type="l", pch=20, ylim=c(0, 30000))

