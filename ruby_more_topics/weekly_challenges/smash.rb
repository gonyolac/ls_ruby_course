# smash('hello, world!') => 'h e l l o w o r l d'
require 'pry'

def smash(string)
  filtered = string.gsub(/[^a-zA-Z]/, '')
  final_string = filtered.split('').join(' ')
end