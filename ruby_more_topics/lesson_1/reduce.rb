# vanilla Array#reduce
# [1, 2, 3].reduce do |acc, num|
#  acc + num
# end

# => 6

# acc = return value of the block; can be initialized with a default value

# [1, 2, 3].reduce(10) do |acc, num|
#  acc + num
# end

# => 16

def reduce(array, default = 0 )
  counter = 0
  acc = default
  
  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end
  acc
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }
reduce(array, 10) { |acc, num| acc + num }

# returns undefined method '+' for nil class
reduce(array) { |acc, num| acc + num if num.odd? }






