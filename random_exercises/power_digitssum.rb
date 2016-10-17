require 'pry'

def power_sumDigTerm(nth)
  sequence = []
  start_number = 81
  until sequence.size == nth
    digits_sum = start_number.to_s.chars.map {|x| x.to_i}.reduce(:+)
    list = (0..nth).to_a.map {|x| digits_sum ** x}
    if list.include?(start_number)
      sequence << start_number
      start_number += 1
    else
      start_number += 1
    end
  end
  sequence[nth-1]
end

p power_sumDigTerm(4)


