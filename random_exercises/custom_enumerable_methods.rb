#python runserver.py -a ptc -u cmartin0001 -u cmartin0003 -u cmartin0004 -u cmartin0005 -u cmartin0006 -u cmartin0007 -u cmartin0008 -p 36y808vw -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l '-6.207099, 106.810187' -st 10 -sd 8

=begin
require 'pry'

class Cipher
  attr_accessor :key
  def initialize(*key)
    raise ArgumentError if key[0] =~ /[^a-z]\s/ || key[0] == ''
    @key = ''
    key.empty? ? 100.times {|x| (@key += ("a".."z").to_a.sample)} : @key = key[0]
  end

  def encode(string)
  end

  def decode(string)
  end
end
=end

def any?(array)
  array.each {|x| return true if yield(x)}
  false
end

def all?(array)
  array.each {|x| return false if yield(x) == false}
  true
end

def none?(array)
  array.each {|x| return false if yield(x) == true}
  true
end

def one?(array)
  counter = 0
  array.each do |x|
    counter += 1 if yield(x) == true
    return false if counter == 2
  end
  array.empty? ? false : (counter == 1 ? true : false)
end

