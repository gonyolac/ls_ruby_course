# fib = Enumerator.new do |x|
#   
# end
require 'pry'

digits = Enumerator.new do |y|
  i = [0]
  next_number = 1
  loop do
    y.yield next_number
    i << next_number
    next_number = i[-1] + i[-2]
  end
end

## optimal
=begin
 
fib = Enumerator.new do |y|
  a,b = 1,1
  
  loop do
    y.yield a
    a, b = b, a + b
  end
end 
=end

p digits.next
