## Introduction to R sample program 2
## file: introR02.R
## Adapted from Venables, W.N., Smith, D.M. and Team, R.C., 2018. An Introduction to R, Version 3.5.1 (2018-07-02)

# Generate x, y and w to demontrate linear models and plots.

# Make x = (1,2,...,20).

x <- 1:20

# Create A ‘weight’ vector of standard deviations.

w <- 1 + sqrt(x)/2

# Create a data frame of two columns, x and y.

dummy <- data.frame(x=x, y= x + rnorm(x)*w)

# Fit a simple linear regression 
# With y to the left of the tilde then x, meaning y being dependent on x.
# Unlike other statistical packages, R does not display all output.  It is recommended
# to create an object to store the estimates.

fm <- lm(y ~ x, data=dummy) 

# Display the summary of the output of model fm.

summary(fm)

# Use w for a weighted regression.

fm1 <- lm(y ~ x, data=dummy, weight=1/w^2) 

# Display the summary of the output of model fm1.

summary(fm1)

# Make the columns in the data frame visible as variables.

attach(dummy)

# Make a nonparametric local regression function. 

lrf <- lowess(x, y)

# Standard point plot.

plot(x, y) 

# Add in the local regression.

lines(x, lrf$y)

# The true regression line: (intercept 0, slope 1).

abline(0, 1, lty=3)

# Unweighted regression line.

abline(coef(fm))

# Weighted regression line.

abline(coef(fm1), col = "red")

# A standard regression diagnostic plot to check for heteroscedasticity. Can you see it?

plot(fitted(fm), resid(fm), xlab="Fitted values", ylab="Residuals", main="Residuals vs Fitted")

# How about now?

abline(0,0, col="red")  

# A normal scores plot to check for skewness, kurtosis and outliers.

qqnorm(resid(fm), main="Residuals Rankit Plot")

rm(fm, fm1, lrf, x, w, dummy)
