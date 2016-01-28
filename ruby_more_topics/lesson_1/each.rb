# vanilla Array#each 
# [1, 2, 3].each { |num| "do nothing" }.select{ |num| num.odd? }
# note the method chain after initial block 

#____________________

# method implementation
def each(array)
  counter = 0 # incremented after while loop; counter = 1 and so on

  while counter < array.size
    yield(array[counter]) 
    # array element (array[counter]) is passed as argument to the implicit block
    counter += 1
  end

  array # array (the caller) is returned, as it was in the vanilla method
end

# method invocation

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

# IMPT: pass the current element being worked on TO THE BLOCK (as an argument?)





