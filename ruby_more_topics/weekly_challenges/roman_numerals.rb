#python runserver.py -a google -u darthcaloyy@gmail.com -p 36y808vw -st 13 -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l "Norfolk, Virginia" 
require 'pry'
module RomanNumerals
  def to_roman
     ones = self % 10
     self.to_s.size > 1 ? tens = self % 100 - ones : 0
     self.to_s.size > 2 ? hundreds = self % 1000 - tens -ones : 0
     self.to_s.size > 3 ? thousands = self % 10000 - hundreds - tens - ones : 0
     convert_thousands(thousands) + convert_hundreds(hundreds) + convert_tens(tens) + convert_ones(ones)
  end

  private

  def convert_ones(ones)
    text = ''
    if ones > 0 && ones < 4
      (1..ones).each {text += 'I'}
    elsif ones == 4
      text += "IV"
    elsif ones > 4 && ones < 9
      text += "V"
      (6..ones).each {text += 'I'}  
    elsif ones == 9
      text += "IX"
    end
    text
  end

  def convert_tens(tens)
    text = ''
    if (10..30).include?(tens)
      (1..tens/10).each {text += 'X'}
    elsif tens == 40
      text += "XL"
    elsif (50..80).include?(tens)
      text += "L"
      (6..tens/10).each {text += 'X'}  
    elsif tens == 90
      text += "XC"
    end
    text
  end

  def convert_hundreds(hundreds)
    text = ''
    if (100..300).include?(hundreds)
      (1..hundreds/100).each {text += 'C'}
    elsif hundreds == 400
      text += "CD"
    elsif (500..800).include?(hundreds)
      text += "D"
      (6..hundreds/100).each {text += 'C'}  
    elsif hundreds == 900
      text += "CM"
    end
    text
  end

  def convert_thousands(thousands)
    text = ''
    (1000..3000).include?(thousands) ? (1..thousands/1000).each {text += "M"} : nil
    text
  end
end

class Fixnum
  include RomanNumerals
end














