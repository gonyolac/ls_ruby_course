require 'pry'
class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    counts = Hash.new
    filtered = @text.gsub(/[^a-zA-Z'0-9]/, ' ')
    word_list = filtered.split.map {|x| x.count("'") > 1 ? x.gsub("'",'').downcase : x.downcase }
    word_list.each {|x| counts[x] = 0}

    counts.each_key {|x| counts[x] = word_list.count(x)}
  end
end
