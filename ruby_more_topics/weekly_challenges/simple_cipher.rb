class Cipher
  LETTERS = ("a".."z").to_a
  attr_accessor :key
  def initialize(*key)
    raise ArgumentError if key[0] =~ /[^a-z]/ || key[0] == ''
    @key = ''
    key.empty? ? 100.times {|x| (@key += ("a".."z").to_a.sample)} : @key = key[0]
  end

  def encode(string)
    string.chars.map.with_index do |x,i|
      final_index = LETTERS.index(x)+positions[i]
      final_index < LETTERS.size ? final_index : final_index -= LETTERS.size 
      LETTERS[final_index]
    end.reduce(:+)
  end

  def decode(string)
    string.chars.map.with_index do |x,i|
      final_index = LETTERS.index(x)-positions[i]
      LETTERS[final_index]
    end.reduce(:+)
  end

  private

  def positions
    @key.chars.map {|x| LETTERS.index(x)}
  end
end

# set of possible combinations k from array
# 2 subsets for each main set: min & max
# goal: find the min among (max-min)
