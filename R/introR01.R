## Introduction to R sample program 1
## file: introR01.R
## Adapted from Venables, W.N., Smith, D.M. and Team, R.C., 2018. An Introduction to R, Version 3.5.1 (2018-07-02)

# Generate two pseudo-random normal vectors of x- and y-coordinates.
# Note that the assignment operator "<-" and "=".  The former is the old operator 
# and considered more general and backward compatible. The latter is more friendly to 
# new users from  other statistical programs (e.g. SPSS, Stata)
#
# rnorm() is a function to generate normally distributed random numbers. The argument 
# within the () indicates number of observations.

x <-rnorm(50) 
y = rnorm(x)

# Plot the points in the plane 

plot(x, y)

# Plot better, using the ggplot2 package 

install.packages("ggplot2")
library(ggplot2)
qplot(x,y)

# Plot better better with ggplot2

ggplot(,aes(x,y)) +theme_bw()+geom_point()

# Check on R objects in the R workspace

ls()

# Remove objects

rm(x, y)

## pch = 0,square
## pch = 1,circle
## pch = 2,triangle point up
## pch = 3,plus
## pch = 4,cross
## pch = 5,diamond
## pch = 6,triangle point down
## pch = 7,square cross
## pch = 8,star
## pch = 9,diamond plus
## pch = 10,circle plus
## pch = 11,triangles up and down
## pch = 12,square plus
## pch = 13,circle cross
## pch = 14,square and triangle down
## pch = 15, filled square
## pch = 16, filled circle
## pch = 17, filled triangle point-up
## pch = 18, filled diamond
## pch = 19, solid circle
## pch = 20,bullet (smaller circle)
## pch = 21, filled circle blue
## pch = 22, filled square blue
## pch = 23, filled diamond blue
## pch = 24, filled triangle point-up blue
## pch = 25, filled triangle point down blue
