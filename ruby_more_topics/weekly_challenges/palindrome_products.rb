# initialize, generate, largest -> new class?

#palindromes = Palindromes.new(max_factor: 999, min_factor: 100) -> initialize
#palindromes.generate -> return array containing (palindromes?) products from 100 to 999
#smallest = palindromes.smallest -> return array containing lowest (alt. largest) value from palindrome.generate array
#assert_equal 10_201, smallest.value -> return element in the array? 
#assert_equal [[101, 101]], smallest.factors

require 'pry'

class Palindromes
  def initialize(max_factor: 1, min_factor: 1, value: 0)
    @value = value
    @max_factor = max_factor
    @min_factor = min_factor
    @palindromes = []
  end

  def generate
    # stores all product combinations given the factors to @palindromes
    array = (@min_factor..@max_factor).to_a
    product_list = array.map do |x|
      array.map do |y|
        x * y
      end
    end
    merged_products = product_list.flatten
    @palindromes = merged_products.select do |x|
      test = x.to_s.reverse.to_i 
      x == test ? true : false
    end
    @palindromes.flatten!
    @palindromes.uniq!
  end

  def largest
    new_palindrome = PalindromeNumber.new(@palindromes.max, @min_factor, @max_factor)
  end

  def smallest
    new_palindrome = PalindromeNumber.new(@palindromes.min, @min_factor, @max_factor)
  end
end

class PalindromeNumber
  def initialize(number, min_factor, max_factor)
    @number = number
    @min_factor = min_factor
    @max_factor = max_factor
    @factor_array = []
  end

  def value
    @number
  end

  def factors
    possible_factors = (@min_factor..@number).to_a
    # for each element of the all_factors array
    confirmed_factors = possible_factors.select do |x|
      @number % x == 0
    end
    confirmed_factors.each do |x|
      factor_pair = []
      other_factor = @number / x
      if x.to_s.size == other_factor.to_s.size 
        if !@factor_array.flatten.include?(x)
          factor_pair << x
          factor_pair << other_factor
          @factor_array << factor_pair
        end
      end
    end
    @factor_array
  end
end
