require 'pry'
def to_currency(number_string)
  rounded = number_string.to_f.round(2)
  temp = rounded.to_s.split('.')
  @change = temp[1]
  @whole_dollar_amt = temp[0]
  
  base = @whole_dollar_amt.split('').reverse.each_slice(3).to_a.reverse
  by_threes = base.map {|x| x.inject(&:+)}
  combined = by_threes.inject {|acc, chunks| acc + ',' + chunks}
  final = combined + '.' + @change
end

test_number = "99999.946"
p to_currency(test_number)