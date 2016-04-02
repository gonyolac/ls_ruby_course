class Prime
  def self.nth(position)
    raise ArgumentError if position == 0
    @position = position
    @prime_numbers = [1,2,3]
    add_next_prime until @prime_numbers[position]
    @prime_numbers[position]
  end

  def self.add_next_prime
    tail = @prime_numbers.last + 2
    tail += 2 until prime?(tail)
    @prime_numbers << tail
    binding.pry
  end

  def self.prime?(number)
    possible_factors = @prime_numbers.select do |x|
      x <= Math.sqrt(number) + 0.01
    end
    test = possible_factors.each do |x|
      number % x
    end
    test.size == 1 ? true : false
  end
end