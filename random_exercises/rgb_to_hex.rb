require 'pry'

def rgb(r, g, b)
  r < 0 ? @r = 0 : (r > 255 ? @r = 255 : @r = r)
  g < 0 ? @g = 0 : (g > 255 ? @g = 255 : @g = g)
  b < 0 ? @b = 0 : (b > 255 ? @b = 255 : @b = b)

  array = [@r, @g, @b]
  array.map {|x| x == 0 ? x = '00': x.to_s(16)}.inject(:+).upcase
end

