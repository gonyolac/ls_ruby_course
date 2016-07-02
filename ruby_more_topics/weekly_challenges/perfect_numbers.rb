class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1
    factors = (1..number).select{|x| (number % x == 0)}
    (factors[0..-2]).inject(:+) == number ? 'perfect' : (number == 1 || factors[0..-2].inject(:+) < number ? 'deficient' : 'abundant')
  end
end