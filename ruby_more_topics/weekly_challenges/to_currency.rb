require 'pry'
def to_currency(number_string)
  rounded = number_string.to_f.round(2)
  temp = rounded.to_s.split('.')
  @change = temp[1]
  @whole_dollar_amt = temp[0]
  
  base = @whole_dollar_amt.split('').reverse.each_slice(3).to_a.reverse
  by_threes = base.map do |x|
    x.inject(&:+)
  end
  all_combined = by_threes.inject do |acc, x|
    acc + ',' + x
  end
  all_combined + '.' + @change
end

test_number = "1000000.946"
p to_currency(test_number)