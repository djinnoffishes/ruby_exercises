# Write a recursive function to calculate the factorial of a given integer

def factorial(n)

  n == 1 ? 1 : n * factorial(n - 1)

end