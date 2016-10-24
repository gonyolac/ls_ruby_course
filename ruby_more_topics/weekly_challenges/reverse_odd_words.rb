#python runserver.py -a ptc -u cmartin0001 -u cmartin0003 -u cmartin0004 -u cmartin0005 -u cmartin0006 -u cmartin0007 -u cmartin0008 -p 36y808vw -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l '-6.207099, 106.810187' -st 10 -sd 8
require 'pry'
def reverse_odd_words(input)
  splitted = input.gsub(/[.]/,'').split
  temp = splitted.map {|x| splitted.index(x).odd? ? (splitted.last == x ? x : x.reverse): x}
  temp.join(' ') + '.'
end

test = "the quick brown fox jumps  over  the lazy   dog   ."

p reverse_odd_words(test)