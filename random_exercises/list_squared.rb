# divisors of 42: 1,2,3,6,7,14,21,42
# sum of divisors ** 2 == 2500
# all integers between m and n (inclusive)
# sum of squared divisors should be a square
# return value should be an array of [n, sum_of_squared_divisors]
require 'pry'
def list_squared(m, n)
  (m..n).map do |num|
    divisors = (1..Math.sqrt(num)).select {|x| num % x == 0}
    divisors += divisors.map {|y| num / y}
    squared_divisors_sum = divisors.uniq.map {|x| x * x}.reduce(:+)
    [num, squared_divisors_sum] if Math.sqrt(squared_divisors_sum) % 1 == 0
  end.compact
end

=begin
# Alternative Solution
require 'set'
def list_squared(m, n)
  (m..n).map do |num|
    divisors = Set.new((1..Math.sqrt(num)).select { |d| num % d == 0 })
    binding.pry
    divisors += divisors.map { |d| num / d } 

    sum_sq_divisors = divisors.map { |d| d * d }.inject(:+)
    [num, sum_sq_divisors] if Math.sqrt(sum_sq_divisors) % 1 == 0
  end.compact
end
=end