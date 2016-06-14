require 'pry'
def get_char_count(string)
  letters = string.gsub(/[\W]/,'').downcase
  filters = letters.chars.uniq.sort{|x,y| letters.count(y) <=> letters.count(x) }
  binding.pry
  collection = {}
  filters.each {|x| collection.has_key?(letters.count(x)) ? collection[letters.count(x)] << x : collection[letters.count(x)] = [x]}
  collection.each_value {|value| value.sort!}
end