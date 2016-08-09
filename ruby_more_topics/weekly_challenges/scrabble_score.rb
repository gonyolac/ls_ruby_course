class Scrabble
  SCORE_GUIDE = {}

  letter_groups = [['A','E','I','O','U','L','N','R','S','T'], ['D','G'], ['B', 'C', 'M', 'P'], ['F', 'H', 'V', 'W', 'Y'], ['K'], ['J', 'X'], ['Q', 'Z']]
  letter_scores = [1,2,3,4,5,8,10]

  letter_groups.each_with_index do |x, i|
    x.each {|y| SCORE_GUIDE[y] = letter_scores[i]}
  end

  def initialize(word)
    word.class == String ? @letters = word.gsub(/\s/,'').upcase.split('') : @letters = ''
  end

  def score
    @letters.size > 0 ? @letters.map {|letter| SCORE_GUIDE.values_at(letter)}.flatten.reduce(&:+) : 0
  end

  def self.score(string)
    Scrabble.new(string).score
  end
end

