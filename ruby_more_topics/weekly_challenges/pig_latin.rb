require 'pry'

class PigLatin
  def self.translate(phrase)
    words = phrase.split()
    translated = words.map {|x| to_pig_latin(x)}.inject {|concat, n| concat+' '+n}
  end

  def self.to_pig_latin(string)
    vowel_index = string.index(/[aeiou]/)
    if string[0].index(/[aeiou]/) || string[0..1] == 'xr' || string[0..1] == 'yt'
      string + 'ay'
    elsif string[0..1] == 'qu' || string[1..2] == 'qu'
      string.slice((string.index('qu') + 2)..(string.size - 1)) + string.slice(0..(string.index('qu') + 1)) + 'ay'
    else
      string.slice(vowel_index..(string.size - 1)) + string.slice(0..(vowel_index -1)) + 'ay'
    end
  end
end
