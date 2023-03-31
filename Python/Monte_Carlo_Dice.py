'''
Monte Carlo Dice Rolling Simulation in Python

This code simulates the rolling of a pair of dice 
by generating a large number of random numbers in the range 1-6.

It then uses NumPy's bincount function to count the number of times each possible sum appears, 
and calculates the probability of each sum by dividing the number of occurrences by the total number of rolls.

This simulation can be used to calculate the probability of rolling any sum from 2 to 12.
'''

# Necessary Imports
import numpy as np

# Number of dice rolls to simulate
num_rolls = 10000

# Simulate the rolls of the dice
rolls = np.random.randint(1,7,size=(num_rolls,2))

# Calculate the sum of each roll
roll_sum = rolls[:,0] + rolls[:,1]

# Calculate the probability of each possible sum
probability = np.bincount(roll_sum) / num_rolls

# Print the results
for i in range(2,13):
    print(f"Probability of rolling a {i}: {probability[i]:.4f}")
