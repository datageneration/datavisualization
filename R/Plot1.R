# R Programming Workshop
# Library: ggplot2
# Boxplot
#install.packages("vroom")
#install.packages("gdata")
#install.packages("janitor")
library(gdata)
library(vroom)
library(janitor)
## Using the package vroom to read in remote data
## Note the make_clean_names (from janitor package) rename friendlier variable names all in lower cases
hpi2016=vroom::vroom("https://raw.githubusercontent.com/datageneration/datavisualization/master/data/hpi2016.csv", .name_repair = janitor::make_clean_names)

library(ggplot2)
theme_set(theme_bw())

# BoxPlot
g <- ggplot(hpi2016, aes(region, happy_planet_index))
g + geom_boxplot(varwidth=T, fill="lightblue") + 
  labs(title="Box plot", 
       subtitle="Happy Planet Index by Region, 2016",
       caption="Source: HPI",
       x="HPI",
       y="Region")

# Vertical X labels
g <- ggplot(hpi2016, aes(region, happy_planet_index))
g + geom_boxplot(varwidth=T, fill="plum") +
  theme(axis.text.x = element_text(angle=90, vjust=0.6,size=12)) +
  labs(title="Box plot", 
       subtitle="Happy Planet Index by Region, 2016",
       caption="Source: HPI",
       x="HPI",
       y="Region")

# Convert region to factor
hpi2016$region = as.factor(hpi2016$region)

# Replace space in X labels with "\n"
levels(hpi2016$region) <- gsub(" ", "\n", levels(hpi2016$region))
g <- ggplot(hpi2016, aes(region, happy_planet_index))
g + geom_boxplot(varwidth=T, fill="plum") + 
  labs(title="Box plot", 
       subtitle="Happy Planet Index by Region, 2016",
       caption="Source: HPI",
       y="HPI",
       x="Region")

# Multiple colors, defining Region as factor
g <- ggplot(hpi2016, aes(region, happy_planet_index))
g + geom_boxplot(aes(fill=factor(region))) + 
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")

# Drop the legend
g <- ggplot(hpi2016, aes(region, happy_planet_index))
g + geom_boxplot(aes(fill=factor(region))) + 
 theme(legend.position="none")+
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")


# Title larger
g <- ggplot(hpi2016, aes(region, happy_planet_index))
g + geom_boxplot(aes(fill=factor(region))) + 
  theme(legend.position="none") +
  theme(plot.title = element_text(size=22)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")


# Title larger, centered
g <- ggplot(hpi2016, aes(region, happy_planet_index))
g + geom_boxplot(aes(fill=factor(region))) + 
  theme(legend.position="none") +
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")

# Hi res=600
tiff("boxplot7res600.tiff", units="in", width=6, height=5, res=600, compression = 'lzw')

# Save to svg using ggsave
ggsave("boxplot7.svg", units="in", width=6, height=5)

g <- ggplot(hpi2016, aes(region, happy_planet_index))
g + geom_boxplot(aes(fill=factor(region))) + 
  theme(legend.position="none") +
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")


# Hi res=300
tiff('boxplot7res300.tiff', units="in", width=6, height=5, res=300, compression = 'lzw')



# Barchart with categories
# Simple counts
ggplot(hpi2016, aes(region)) + 
  geom_bar(aes(fill=happy_planet_index), width = 0.5) + 
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="count")

dev.off()
# Barchart with categories
# Factor
ggplot(hpi2016, aes(region)) + 
  geom_bar(aes(fill=factor(happy_planet_index)), width = 0.5) + 
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="count")

# Barchart with categories
# Factor with 5 categories
# Turn Happy.Planet.Index into 5-categories
# Repositioning legend

fhpi=cut(hpi2016$happy_planet_index,c(10,20,30,40,50))
ggplot(hpi2016, aes(region)) + 
  geom_bar(aes(fill=sort(fhpi,decreasing=F)), width = 0.5) + 
  theme(plot.title = element_text(size=22,hjust = 0.5),legend.position="bottom") +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="count",
       fill="Happy Planet Index")
  
