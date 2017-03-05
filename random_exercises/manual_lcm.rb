require 'pry'
def smallest(n)
  base = 1
  (1..n).each do |x|
    multiplier = 0
    if base % x != 0
      (x % 2 == 0 ? multiplier = 2 : (x % 3 == 0 ? multiplier = 3 : (x % 5 == 0 ? multiplier = 5 : (x % 7 == 0 ? multiplier = 7: multiplier = x))))
      base *= multiplier
    end
  end
  base
end

p smallest(11)
