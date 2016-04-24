require 'pry'

def sursurungal(txt)
  seen_words = ''
  array = txt.split(' ')
  test = array.map do |x|
    if x =~ /\d/
      combined = ' ' + array[array.index(x)+1]
      seen_words << combined
      x << combined
    else
      seen_words.include?(x) ? '' : x
    end
  end
  test.delete('')
  test.map {|x| convert_word(x)}.join(' ')
end

def convert_word(x)
  array = x.split(' ')
  
  if array.size < 2
    word = array[0]
    count = nil
  else
    count = array[0].to_i
    word = array[1]

    if count == 2
      word.gsub!(/s\z/,'')
      word = 'bu'+ word
    elsif count > 2 && count < 9
      word.gsub!(/s\z/,'')
      word = word + 'zo'
    elsif count > 9
      word.gsub!(/s\z/,'')
      word = 'ga' + word + 'ga'
    else
      word
    end
  end
  final = count.to_s + ' ' + word
  final.strip
end

p sursurungal("\n3 pigzo\nmet 1 wolf\n2 buday ago")

