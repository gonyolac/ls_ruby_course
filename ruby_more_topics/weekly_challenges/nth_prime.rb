require 'pry'

class Prime
  def self.nth(position)
    raise ArgumentError if position == 0

    prime_numbers = (1..10.52*position).to_a.select {|x| prime?(x)}
    prime_numbers[position]
  end

  private

  def self.prime?(number)
    test_factors =(2..(Math.sqrt(number))).to_a
    testing_array = test_factors.map {|x| number % x == 0}
    testing_array.include?(true) ? false : true
  end
end