# Plotting time series (Nathan Yau example1)
# Barchart

library(RColorBrewer)
hotdogs <-
  read.csv("http://datasets.flowingdata.com/hot-dog-contest-winners.csv",
           sep=",", header=TRUE)
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col="red",
        border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")
fill_colors <- c()
for ( i in 1:length(hotdogs$Country) ) {
  if (hotdogs$Country[i] == "United States") {
    fill_colors <- c(fill_colors, "grey")
  } else {
    fill_colors <- c(fill_colors, "forestgreen")
  }
}
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=fill_colors,
        border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")


fill_colors <- c()
for ( i in 1:length(hotdogs$New.record) ) {
  if (hotdogs$New.record[i] == 1) {
    fill_colors <- c(fill_colors, "limegreen")
  } else {
    fill_colors <- c(fill_colors, "grey")
  }
}
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=fill_colors,
        border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")

# Add space between bars
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=fill_colors,
        border=NA, space=0.3, xlab="Year", ylab="Hot dogs and buns (HDB) 
eaten")

# Stack bar data
hot_dog_places <-
  read.csv("http://datasets.flowingdata.com/hot-dog-places.csv", sep=",", header=TRUE)
names(hot_dog_places) <- c("2000", "2001", "2002", "2003", "2004",
                           "2005", "2006", "2007", "2008", "2009", "2010")

hot_dog_matrix <- as.matrix(hot_dog_places)
barplot(hot_dog_matrix, border=NA, space=0.25, ylim=c(0, 200),
        xlab="Year", ylab="Hot dogs and buns (HDBs) eaten",
        main="Hot Dog Eating Contest Results, 1980-2010")








