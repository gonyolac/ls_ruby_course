require 'pry'
def reverse_odd_words(input)
  splitted = input.gsub(/[.]/,'').split
  temp = splitted.map {|x| splitted.index(x).odd? ? (splitted.last == x ? x : x.reverse): x}
  temp.join(' ') + '.'
end

test = "the quick brown fox jumps  over  the lazy   dog   ."

p reverse_odd_words(test)