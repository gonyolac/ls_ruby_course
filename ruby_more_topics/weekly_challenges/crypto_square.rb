require 'pry'
class Crypto
  def initialize(text)
    @unfiltered = text
  end

  def normalize_plaintext
    @unfiltered.gsub(/\W/,'').downcase
  end

  def size
    normalize_plaintext
    square_root = Math.sqrt(normalize_plaintext.length).round(1)
    square_root.to_s.end_with?('0') ? square_root.to_i : square_root.round(1).to_i + 1
  end

  def plaintext_segments
    size
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    raw_encrypted = plaintext_segments.map{|x| x.split('')}.inject {|acc, segment| acc.zip(segment)}.flatten
    @encrypted = raw_encrypted.map {|x| x ? x : ' '}.join('')
    for_show = @encrypted.gsub(' ','')
  end

  def normalize_ciphertext
    ciphertext
    @encrypted.scan(/.{1,#{plaintext_segments.size}}/).map{|x| x.gsub(' ','')}.join(' ')
  end
end
