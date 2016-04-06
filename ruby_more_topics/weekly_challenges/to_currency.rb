require 'pry'
def to_currency(number_string)
  raise ArgumentError if number_string =~ /[^\dD.]/
  rounded = number_string.to_f.round(2).to_s.split('.')
  @whole_dollar_amt = rounded[0]

  @change = rounded[1]
  @change.size < 2 ? @change << '0' : @change

  base = @whole_dollar_amt.split('').reverse.each_slice(3).to_a.reverse
  by_threes = base.map {|x| x.reverse.inject(&:+)}
  combined = by_threes.inject {|acc, chunks| acc + ',' + chunks}
  final = combined + '.' + @change
end