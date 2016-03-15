# Assessment Review

# local variable scope

str1 = "string"

def test_method
  puts str1
end

test_method

# => returns error 
# local variables need to be passed into a method; otherwise inacessible

str2 = "string2" # variable initialization; fairly similar to reassignment

[1].each do |n|
  puts str2
  str2 = "new string2" # variable reassignment 
end

# => string2
# blocks form an inner scope that allows access to local variables
# outer scope variables can be modified from within a block

_______________________________

# method arguments

def run(str)
  # puts str (results in no change to a)
  # str << 'world' # << is destructive; mutates a into 'hello world'
  str += 'world' # variable reassignment
end

a = 'hello'
run(a)

_______________________________

# popular collection methods

# each, reject, reduce, select, map, collect

