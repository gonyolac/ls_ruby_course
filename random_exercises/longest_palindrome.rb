require 'pry'
def longest_palindrome(string)
  counter = 0
  array = []
  while counter < string.size
    counter2 = counter
    while counter2 < string.size
      string.include?(string[counter..counter2].reverse) && string[counter..counter2].include?(string[counter..counter2].reverse) ? (array << string[counter..counter2].size) : nil 
      counter2 += 1
    end
    counter += 1
  end
  array.max != nil ? array.max : 0
end

p longest_palindrome("baa")