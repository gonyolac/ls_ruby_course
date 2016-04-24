require 'pry'
def zero(operation = nil)
  operation == nil ? 0 : 0.send(@operation,@number)
end
def one(operation = nil)
  operation == nil ? 1 : 1.send(@operation,@number)
end
def two(operation = nil)
  operation == nil ? 2 : 2.send(@operation,@number)
end
def three(operation = nil)
  operation == nil ? 3 : 3.send(@operation,@number)
end
def four(operation = nil)
  operation == nil ? 4 : 4.send(@operation,@number)
end
def five(operation = nil)
  operation == nil ? 5 : 5.send(@operation,@number)
end
def six(operation = nil)
  operation == nil ? 6 : 6.send(@operation,@number)
end
def seven(operation = nil)
  operation == nil ? 7 : 7.send(@operation,@number)
end
def eight(operation = nil)
  operation == nil ? 8 : 8.send(@operation,@number)
end
def nine(operation = nil)
  operation == nil ? 9 : 9.send(@operation,@number)
end
# operations
# must return... 
# something that tells a number method of the operation; 
# along with a number as its argument
def plus(number)
  @operation = '+' 
  @number = number
end

def minus(number)
  @operation = '-'
  @number = number
end

def times(number)
  @operation = '*'
  @number = number
end

def divided_by(number)
  @operation = '/'
  @number = number.to_f
end

=begin
# optimal solution
# shortened version of above

class Object
  %w(zero one two three four five six seven eight nine).each_with_index do |number, idx|
    define_method(number) do |args = nil|
      args == nil ? idx.to_f : idx.send(*args)
    end
  end

  %w(plus + minus - times * divided_by /).each_slice(2) do |operation, symbol|
    define_method(operation) do |n|
      [symbol, n]
    end
  end
end
=end
