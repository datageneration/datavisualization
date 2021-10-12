install.packages("gapminder")

library(gapminder)
gm = gapminder

summary(gapminder)
str(gapminder)



gm=gapminder
head(gm)
summary(gm)
table(gm$continent)

# Plot one variable 
hist(gm$lifeExp)

# Plot two variables with logged version of x
plot(lifeExp ~ gdpPercap, gm, subset = year == 2007, log = "x", pch=20)
# Plot two variables with selected country
plot(lifeExp ~ year, gm, subset = country == "Cambodia", type = "p")
# Try different plot types 
plot(lifeExp ~ year, gm, subset = country == "Cambodia", type = "l")
# Different symbols
plot(lifeExp ~ year, gm, subset = country == "Cambodia", type = "b", pch=18)

# More layered plots using ggplot2, with regression line
install.packages("ggplot2")
library(ggplot2)
p <- ggplot(data = gm)
p + geom_point(size=2) # Why it is not working?
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
# Alternative
# p <- ggplot(data=gm, aes(x=gdpPercap, y=lifeExp, color=continent))

p + geom_point()

# Add some color grouping
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp, color=continent))
p + geom_point()

# Add a regression line, dropped the color grouping
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(pch=16) + geom_smooth(method="lm") 

# Add a  line, dropped the color grouping, try other method
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(pch=20) + geom_smooth(method="loess") 

# Add a regression line with logged x, dropped the color grouping
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(pch=16) + geom_smooth(method="lm") + 
  scale_x_log10()

# More layered plots with ggplot2, line with other methods (Generalized Additive Model)
if (require("ggplot2")) {
  p <- ggplot(data = gm)
}
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(pch=16) + geom_smooth(method="gam") + 
  scale_x_log10()


# Why it is not purple?
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = "purple"))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()

#  How about now?
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 
p + geom_point(color = "steelblue", cex = .5) +
  geom_smooth(method = "loess") + scale_x_log10() + theme_bw()
