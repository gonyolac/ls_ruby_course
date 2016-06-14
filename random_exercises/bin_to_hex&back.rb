require 'pry'
BINARY = ["0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101","1110","1111"]
HEX = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']

def bin_to_hex(binary_string)
  if binary_string.size % 4 != 0  
    next_factor = (binary_string.size / 4) + 1
    extra_zeros = "0"*(next_factor*4 - binary_string.size)
    binary_string.prepend(extra_zeros)
  end
  grouped = binary_string.scan(/.{1,4}/)
  end_bin = grouped.map {|x| HEX[BINARY.index(x)]}.join('')
  (end_bin[0] == '0' && end_bin.size > 1) ? end_bin[1..end_bin.size-1] : end_bin
end

def hex_to_bin(hex_string)
  formatted = hex_string.split('').map{|x|x.downcase}
  end_hex = formatted.map{|x| BINARY[HEX.index(x)]}.join('')
  end_hex.gsub!(/\A0{4}/,'')
  end_hex == '' ? end_hex = "0" : (end_hex[0] == '0' ? end_hex.slice(1..end_hex.length-1) : end_hex)
end

p hex_to_bin('04D2')


