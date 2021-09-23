## Introduction to R sample program 6
## file: introR05.R
## Adapted from Venables, W.N., Smith, D.M. and Team, R.C., 2018. An Introduction to R, Version 3.5.1 (2018-07-02)

# Demo: complex arithmetic.

th <- seq(-pi, pi, len=100) 
z <- exp(1i*th)

# 1i is used for the complex number i.
par(pty="s") 
plot(z, type="l")

# Plotting complex arguments means plot imaginary versus real parts. This should be a circle.
w <- rnorm(100) + rnorm(100)*1i

# Suppose we want to sample points within the unit circle. One method would be to take complex numbers with standard normal real and imaginary parts . . .
w <- ifelse(Mod(w) > 1, 1/w, w)
# . . . and to map any outside the circle onto their reciprocal.
plot(w, xlim=c(-1,1), ylim=c(-1,1), pch="+",xlab="x", ylab="y") 
lines(z) 
# All points are inside the unit circle, but the distribution is not uniform.
w <- sqrt(runif(100))*exp(2*pi*runif(100)*1i)
plot(w, xlim=c(-1,1), ylim=c(-1,1), pch="+", xlab="x", ylab="y")
lines(z) 
# The second method uses the uniform distribution. The points should now look more
# evenly spaced over the disc.

rm(th, w, z)
