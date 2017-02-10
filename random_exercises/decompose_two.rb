# [[k1,k2,k3],r]
# each kn is maximized
# 2^() + ... + n^(kn-1) + r = num

def decompose(num)
  # iterate from 2 and onwards -> maximize
  # when 2 (aka base) is maximized -> go to next base
  # final output must be the [array_of_exponents, remainder]

  start_number = num
  exponents = []
  base = 2

  loop do
    test_exponent = 2
    until base ** test_exponent > start_number
      test_exponent += 1
    end
    break if test_exponent == 2
    exponents << (test_exponent - 1)
    start_number -= (base ** exponents[-1])
    base += 1
    break if start_number == 0
  end
  [exponents, start_number]
end

# optimal solution
=begin

def decompose(num)
  exponents = []
  base = 2

  until base*base > num do
    exp = Math.log(num, base).to_i
    exponents << exp
    num -= base ** exp
    base += 1
  end

  [exponents, num]
end

=end