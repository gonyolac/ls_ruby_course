# filter out all punctuations
# hash key must be the first occurence of a word in the text "Then..then" -> key: Then
require 'pry'

test = 'Then Almitra spoke again and said..."And what of Marriage, master?" And he answered saying:
You were born together, and together you shall be forevermore. You shall be together when the
white wings of death scatter your days. Aye, you shall be together even in the silent memory of
 God. But let there be spaces in your togetherness, And let the winds of the heavens dance
 between you. Love one another, but make not a bond of love. Let it rather be a moving sea between
the shores of your souls. Fill each other\'s cup but drink not from one cup. Give one another of
 your bread but eat not from the same loaf. Sing and dance together and be joyous,
but let each of you be alone, Even as the strings of a lute are alone though they quiver with the
 same music. Give your hearts, but not into each other\'s keeping. For only the hand of Life can
 contain your hearts. And stand together, yet not too near together. For the pillars of the
 temple stand apart, And the oak tree and the cypress grow not in each other\'s shadow.'
 
def word_count(text)
  final_list = Hash.new
  filtered = text.gsub(/[^a-zA-Z\s]/, ' ')
  all_words = filtered.split

  possible_keys = all_words.each do |x|
    if !final_list.has_key?(x.downcase) 
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

p word_count(test)
