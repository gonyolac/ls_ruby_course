require 'pry'
def f(n,m)
  @m = m
  @n = n
  if @n == 2 || @n == 1
    running_total = 1
  elsif @n == 0
    running_total = 0 
  else
    @start = [1]
    running_total = 0
    loop do
      current = @start[-1] % @m
      running_total += current
      next_number
      break if @start.last > @n 
    end
    running_total
  end
end

def next_number
  next_number = @start[-1] + 1
  @start << next_number
end

p f(25886104, 85766697)