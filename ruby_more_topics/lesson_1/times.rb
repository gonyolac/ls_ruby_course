# Integer#times method

# 5.times do |num|
#   puts num
# end

#________________________

# method implementation

def times(number)
  counter = 0
  while counter < number do
    yield(counter) # counter serves as the argument for the implicit block
    counter += 1
  end

  number
end

# method invocation

times(5) do |num|
  puts num
end


