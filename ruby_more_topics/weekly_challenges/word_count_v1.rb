# filter out all punctuations
# hash key must be the first occurence of a word in the text "Then..then" -> key: Then
require 'pry'

class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    final_list = Hash.new
    filtered = @text.gsub(/[^a-zA-Z'0-9]/, ' ')
    all_words = filtered.split.map do |x|
      if x.count("'") > 1
        x.gsub("'",'').downcase
      else
        x.downcase
      end
    end

    possible_keys = all_words.each do |x|
      if !final_list.has_key?(x) 
        final_list[x] = 0
      end
    end

    scanning_pool = all_words.map do |x|
      x.downcase
    end

    final_list.each_key do |word_key|
      if scanning_pool.include?(word_key)
        final_list[word_key] = scanning_pool.count(word_key)
      elsif scanning_pool.include?(word_key.downcase) && all_words.include?(word_key)
        special_pool = scanning_pool.map { |x| x.capitalize }
        final_list[word_key] = special_pool.count(word_key)
      end
    end
  end
end
