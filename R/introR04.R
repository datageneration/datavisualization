## Introduction to R sample program 4
## file: introR04.R
## Adapted from Venables, W.N., Smith, D.M. and Team, R.C., 2018. An Introduction to R, Version 3.5.1 (2018-07-02)

# Generate contour maps.

# x is a vector of 50 equally spaced values in  −π≤x≤π. y is the same.
x <- seq(-pi, pi, len=50)
y<-x 

# f is a square matrix, with rows and columns indexed by x and y respectively, 
# of values of the function cos(y)/(1 + x2).

f <- outer(x, y, function(x, y) cos(y)/(1 + x^2))

# Save the plotting parameters and set the plotting region to “square”.

oldpar <- par(no.readonly = TRUE) 
par(pty="s")

# Make a contour map of f; add in more lines for more detail.

contour(x, y, f)
contour(x, y, f, nlevels=15, add=TRUE)

# fa is the “asymmetric part” of f. (t() is transpose).
fa <- (f-t(f))/2

# Another contour plot.
contour(x, y, fa, nlevels=15)

# Restore the old graphics parameters.
par(oldpar)

# High density image plots.
image(x, y, f)
image(x, y, fa)

# Clean up
objects(); rm(x, y, f, fa, oldpar)
