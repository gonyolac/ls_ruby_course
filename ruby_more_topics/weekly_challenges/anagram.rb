require 'pry'
class Anagram
  def initialize(string)
    @string = string
  end

  def match(filter_array)
    filter_array.select {|x| x.downcase.split('').sort == @string.downcase.split('').sort }
                .select {|word| word.downcase != @string}
  end
end