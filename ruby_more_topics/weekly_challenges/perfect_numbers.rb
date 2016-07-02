class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1
    factors = []
    (1.upto(number) {|x| (number % x == 0) ? factors.push(x) : nil})
    (factors[0..-2]).inject(:+) == number ? 'perfect' : (number == 1 || factors[0..-2].inject(:+) < number ? 'deficient' : 'abundant')
  end
end