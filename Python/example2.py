import matplotlib.pyplot as plt

# Creating variables
xs = [1,3,5,7,9]
ys = [x**2 for x in xs]

# Simple plot
plt.plot(xs, ys)

xs = range(-100,100,10)
x2 = [x**2 for x in xs]
negx2 = [-x**2 for x in xs]

# Combined plot

plt.plot(xs, x2)
plt.plot(xs, negx2)
plt.xlabel("x")
plt.ylabel("y")
plt.ylim(-2000, 2000)
plt.axhline(0,color="red") # horiz line
plt.axvline(0,color="green") # vert line
plt.show()

# Saving plot
plt.savefig("nonlinear.png")
