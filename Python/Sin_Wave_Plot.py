'''
Sine Wave Plotting in Python

This code uses NumPy to generate a range of x values from 0 to 2*pi, 
and then uses these values to calculate the corresponding y values 
of the sine wave using the sin function.

The sine wave is then plotted using the plot function from the matplotlib library, 
and the plot is displayed using the show function.

This code generates a simple sine wave with 100 points, 
but it can be easily modified to generate more complex or larger waves.
'''

# Necessary Imports 
import numpy as np
import matplotlib.pyplot as plt

# Generate a range of x values from 0 to 2*pi
x = np.linspace(0, 2*np.pi, 100)

# Calculate the sine wave using the x values
y = np.sin(x)

# Plot the sine wave
plt.plot(x, y)

# Show the plot
plt.show()
