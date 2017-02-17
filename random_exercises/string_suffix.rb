require 'pry'
def string_suffix(string)
  match_total = 0
  0.upto(string.size-1) do |x|
    string[x..-1].chars.each_with_index do |y,i|
      y == string[i] ? match_total += 1 : break
    end
  end
  match_total
end
