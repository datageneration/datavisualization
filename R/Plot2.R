# Simple barchart and Dotplot

# Create Karl Schedule data
# Library dplyr for data management
library(dplyr)

# Library ggplot2 for plotting
library(ggplot2)

# Creating data

do=c("Research", "Eat", "Commute", "Teach","Sleep")
hour=as.numeric(c("11","2","2","3","6"))
karlschedule=data.frame(do,hour)

# Simple procedures to convert do to factor, sort the data by hour
kschedule=karlschedule %>% 
  arrange(hour) %>% 
  mutate(do = factor(do, levels = .$do))

ggplot(kschedule, aes(do, hour)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_bw() +
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Karl's schedule", 
       subtitle="",
       caption="",
       y="Number of hours",
       x ="What does Karl do?")

ggsave("bchart.svg", width = 5, height = 4, dpi = 300, units = "in")

# Save the chart to 300 dpi png
ggsave(filename = "bchartres300.png", ggplot(kschedule, aes(do, hour)) +
         geom_bar(stat = "identity") +
         coord_flip() +
         theme_bw() +
         theme(plot.title = element_text(size=22,hjust = 0.5)) +
         labs(title="Karl's schedule", 
              subtitle="",
              caption="",
              y="Number of hours",
              x ="What does Karl do?"),
       width = 5, height = 4, dpi = 300, units = "in", device='png')

ggplot(kschedule, aes(hour, do)) + geom_point()+
  theme_bw() +
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Karl's schedule", 
       subtitle="",
       caption="",
       y="Number of hours",
       x ="What does Karl do?")
ggsave("dotplot.svg", width = 5, height = 4, dpi = 300, units = "in")


ggsave(filename = "dotplotres300.png", ggplot(kschedule, aes(hour, do)) + geom_point()+
         theme_bw() +
         theme(plot.title = element_text(size=22,hjust = 0.5)) +
         labs(title="Karl's schedule", 
              subtitle="",
              caption="",
              y="Number of hours",
              x ="What does Karl do?"),
       width = 5, height = 4, dpi = 300, units = "in", device='png')