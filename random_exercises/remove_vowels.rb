def no_vowels(strings)
  filtered = strings.map do |word|
    word.gsub(/[aeiou]/, '')
  end
end

test_array = ['green', 'yellow', 'black', 'white']

p no_vowels(test_array)