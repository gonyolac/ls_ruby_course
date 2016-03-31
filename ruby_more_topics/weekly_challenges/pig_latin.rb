require 'pry'

class PigLatin
  def self.translate(phrase)
    words = phrase.split()
    translated = words.map do |x|
      to_pig_latin(x)
    end
    translated.inject {|concat, n| concat + ' ' + n}
  end

  def self.to_pig_latin(string)
    test = string[0..2]
    vowel_index = string.index(/[aeiou]/)
    if test[0].index(/[aeiou]/)
      string + 'ay'
    elsif test[0..1] == 'xr' || test[0..1] == 'yt'
      string + 'ay'
    elsif test[0..1] == 'qu' || test[1..2] == 'qu'
      string.slice((string.index('qu') + 2)..(string.size - 1)) + string.slice(0..(string.index('qu') + 1)) + 'ay'
    else
      string.slice(vowel_index..(string.size - 1)) + string.slice(0..(vowel_index -1)) + 'ay'
    end
  end
end
