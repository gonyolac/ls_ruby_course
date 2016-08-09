def longest_consec(array, k)
  k > array.size || k <= 0 ? '' : array.each_cons(k).map(&:join).max_by(&:size)
end

=begin
#before each_cons

require 'pry'
def longest_consec(array, k)
  if k > array.size || k <= 0
    ""
  else
    temp = array.permutation(k).to_a.select do |group|
      indices = group.map {|x| array.index(x)}
      (indices.min..indices.max).to_a == indices
    end
    temp.map {|x| x.inject(:+)}.max_by(&:length)
  end
end
=end


p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 3)

