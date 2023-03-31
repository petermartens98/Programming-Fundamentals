# Necessary Imports
import random

# Number of random points to generate
num_points = 1000000

# Initialize a counter for the number of points inside the circle
inside = 0

# Generate the random points
for i in range(num_points):
    x = random.uniform(-1,1)
    y = random.uniform(-1,1)
  
    # Check if the point is inside the circle
    if x**2 + y**2 <= 1:
        inside += 1

# Calculate the value of pi
pi = 4 * inside / num_points

# Print the result
print(pi)
