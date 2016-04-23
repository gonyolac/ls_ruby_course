require 'pry'
def sum_pairs(ints, s)
  current_pair = []
  current_index_sum = 0
  ints.each do |x|
    n = s - x

    if ints.include?(n) && (ints.index(x) != ints.index(n))
      index_test = ints.index(x) + ints.index(n) 
      if current_index_sum == 0 || index_test < current_index_sum 
        current_pair = [x, n]
        current_index_sum = index_test
      end
    elsif ints.include?(n) && ints.count(n) > 1
      temp_pair = [x, n]
      temp_index = ints.index(x)
      ints[ints.index(x)] = 'done'
      index_test = temp_index + ints.index(n)
      if current_index_sum == 0 || index_test < current_index_sum
        current_pair = temp_pair
        current_index_sum = index_test
      end
    else
      nil
    end
  end
  current_pair.empty? ? nil : current_pair
end

#optimal solution
=begin

require 'set'
require 'pry'

def sum_pairs(ints, s)
  seen = Set.new
  ints.each { |x|
    return [s - x, x] if seen.include?(s - x)
    seen << x
  }
  nil
end

p sum_pairs([1,2,3,4,5], 6)
  
=end
