# lowest_number([23, 550, 1, 80]) # => 12355080
require 'pry'

def lowest_number(array)
  array.delete_if {|x| x == 0}
  sorted = []
  array.each {|x| sorted << x.to_s}
  sorted.sort.inject(:+)
end