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

