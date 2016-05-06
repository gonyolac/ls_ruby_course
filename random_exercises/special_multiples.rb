require 'pry'
require 'prime'
def count_specMult(n, maxVal)
  primes = []
  start_number = 2
  until primes.size == n
    primes << start_number if Prime.prime?(start_number)
    start_number += 1
  end
  
  valid_numbers = []
  base = primes.inject(:*)
  counter = 1
  loop do
    test = base * counter
    break if test > maxVal || test == maxVal
    valid_numbers << test
    counter += 1
  end 
  valid_numbers
end