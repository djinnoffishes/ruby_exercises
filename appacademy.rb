# Write a method, pow, that takes two (non-negative, integer) numbers, 
# base and exponent and returns base raised to the exponent power. (No 
# fair using Ruby's base ** exponent notation!).

def pow(base, exponent)

  result = 1
  exponent.times do 
    result = base.to_i * result
  end
  result
end



# Write a method, sum which takes an array of numbers and returns 
# the sum of the numbers.

def sum(array)
  y = 0
  array.each do |x|
    y += x
  end
  y
end

# Write a method, is_prime?, that takes a number num and returns true 
# if it is prime and false otherwise.

def is_prime?(num)
  i = 2
  while i < num
    divisible = ((num % i) == 0)
    if divisible
      return false
    end
    i += 1
  end
  true
end


# Using your is_prime? method, write a new method, primes that takes 
# a (non-negative, integer) number max and returns an array of all prime 
# numbers less than max.

def primes(max)
  array = []
  i = 2
  while i < max.abs
    if is_prime?(i)
      array << i
    end
    i += 1
  end
  array
end


# write a recursive function to find the highest prime factor of any number

def prime_recur(num)

  max_prime = 2
  i = num

  while i > (num/2)
    if is_prime?(i)
      max_prime = i
    end
    i -= 1
  end

  max_prime

end



