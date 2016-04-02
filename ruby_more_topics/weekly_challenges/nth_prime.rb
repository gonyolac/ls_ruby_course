require 'pry'

class Prime
  def self.nth(position)
    # should return integer of the prime
    raise ArgumentError if position == 0

    prime_numbers = (1..104743).to_a.select do |x|
      basic_test?(x) && not_composite?(x)
    end
    prime_numbers[position]
  end

  private

  def self.basic_test?(number)
    (number % 1 == 0) && (number % number == 0)
  end

  def self.not_composite?(number)
    test_factors =(2..(Math.sqrt(number))).to_a
    testing_array = test_factors.map do |x|
      (number % x == 0 && (number / x) != 1)
    end
    testing_array.include?(true) ? false : true
  end
end
