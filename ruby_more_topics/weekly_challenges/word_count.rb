#use hash
require 'pry'

test = "The quick brown fox jumps over the lazy dog. Quick Brown Fox"

def word_count(text)
  counts = Hash.new
  filtered = text.gsub(/[^a-zA-Z\s]/, '')    #filter out all punctuations
  all_words = filtered.split
  # hash key must be the first occurence of a word in the text "Then..then" -> key: Then
  possible_keys = all_words.each do |x| # convert each word in array into hash key
    if !counts.has_key?(x.capitalize)
      counts[x] = 0
    end
  end
  scanning_pool = all_words.map do |x|
    x.downcase
  end
  # Array#count for number of occurences in scanning_pool
  counts.each_key do |word_key|
    if scanning_pool.include?(word_key)
      counts[word_key] = scanning_pool.count(word_key)
    elsif scanning_pool.include?(word_key.downcase) && all_words.include?(word_key)
      special_pool = []
      scanning_pool.each { |x| special_pool << x.capitalize }
      counts[word_key] = special_pool.count(word_key)
    end
  end
end

p word_count(test)