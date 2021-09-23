## Introduction to R sample program 6
## file: introR06.R
## Basics of Data Visualization
## Adapted from Wickham, H. and Grolemund, G., 2016. R for data science. O'Reilly Media, Inc.
## Web version: http://r4ds.had.co.nz/data-visualisation.html

## This sample program is based on the tidyverse bundle.

# Install the tidyverse bundle and call packages into library.

install.packages("tidyverse")
library(tidyverse)

# Check the mpg dataset.
# Details of variables available at https://ggplot2.tidyverse.org/reference/mpg.html.

mpg

# Create a data frame for viewing.

mpgdf=data.frame(mpg)

# Scatter plot.

ggplot(data = mpg)

# Why?

# Full Scatter plot defined.  

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) 

# Full Scatter plot defined, theme added.  

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))+theme_classic()

# Add one more variable.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Use size instead of color.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


# Transparency.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Shape.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Why some are missing?

# More to learn about the "+" placement.

ggplot(data = mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy))

# Placed right.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Faceting.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2) + theme_bw()

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl) + theme_bw()


# Smoothing the data

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Categorized by drv variable.

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# Overlay multiple plots.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

# Barcharts using diamond dataset.
# Variable details: https://ggplot2.tidyverse.org/reference/diamonds.html

diamonds

dmdf=data.frame(diamonds)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut)) + theme_bw()


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut)) + theme_bw() 

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut)) + coord_flip() + theme_bw()

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut)) + coord_polar() + theme_bw()

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity)) + theme_bw()


ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")  + theme_bw()

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity") + theme_bw()

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill") + theme_bw()

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge") + theme_bw()
