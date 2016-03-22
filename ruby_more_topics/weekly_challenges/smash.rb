# smash('hello, world!') => 'h e l l o w o r l d'
require 'pry'

def smash(string)
  filtered = string.gsub(/[\W]/, '')
  string_array = filtered.split('')
  final_string = string_array.inject {|sum, n| sum + (' ' + n)}
end
