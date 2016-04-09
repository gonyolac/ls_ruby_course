# specified numbers would be the filter for multiples
# default is 3 and 5
# multiples upto a number EXCEPT that number
# natural numbers only

require 'pry'

class SumOfMultiples
  def initialize(a=3, b=5, *other_number)
    @filter = [a, b] << other_number
    @filter.flatten!
  end

  def self.to(limit_number, multiple_filter = [3, 5])
    filter = multiple_filter
    sequence = [1]
    sum = 0
    until sequence.last == limit_number do
      current_number = sequence.last
      multiple?(filter, current_number) ? sum += current_number : sum += 0 
      sequence << current_number + 1
    end
    sum
  end

  def to(limit_number)
    self.class.to(limit_number, @filter)
  end

  private

  def self.multiple?(f_numbers, number)
    test = f_numbers.map {|x| number % x == 0 ? true : false}.include?(true) ? true : false
  end
end
