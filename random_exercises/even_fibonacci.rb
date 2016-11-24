def even_fib(m)
  fib = [1,1]
  sum = 0
  loop do
    next_number = fib[-2] + fib[-1]
    fib << next_number
    break if fib[-1] >= m
    sum += next_number if next_number.even?
  end
  sum
end

=begin
#Optimal Solution(?)
def even_fib(m)
  start_number, next_number, sum = 0, 1, 0
  while next_number < m
    sum += next_number if next_number.even?
    start_number, next_number = next_number, start_number + next_number
  end
  sum
=end