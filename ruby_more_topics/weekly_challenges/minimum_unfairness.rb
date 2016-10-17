# set of possible combinations k from array
# 2 subsets for each main set: min & max
# goal: find the min among (max-min)
=begin
#working, but inefficient solution

def min_unfairness(array,k)
  return 0 if k < 2
  set = array.combination(k).to_a.map {|x| [x.max, x.min]}
  set.map {|x| x[0] - x[1]}.min
end
=end

def min_unfairness(array, k)
  array.sort!
  k == 0 ? 0 : (0..(array.size-k)).map {|x| array[x+k-1]-array[x]}.min
end

p min_unfairness([30,100,1000,150,60,250,10,120,20],5)







