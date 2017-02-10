require 'pry'

OPERATIONS = %w(+ - * /)
class Fixnum
  %w(plus minus times divided_by).each_with_index do |opword, idx|
    define_method(opword) { "#{self}#{OPERATIONS[idx]}" }
  end
end

=begin
# shortened version
# idea was to use string storage to 'remember' first given integer aka self under this scope
# i.e. 
  def plus
    "#{self}+"
  end
=end

class Calc
  %w(zero one two three four five six seven eight nine).each_with_index do |number, idx|
    define_method(number) { idx.to_i }
  end
end

class String
  %w(zero one two three four five six seven eight nine).each_with_index do |number, idx|
    define_method(number) { self[-2].to_i.method(self[-1]).(idx) }
  end
end

=begin
# calculator-like optimal solution 
# note: still monkey patches Fixnum class
class Fixnum
  OPERATIONS = %w(+ - * /)

  %w(plus minus times divided_by).each.with_index do |x,i|
    define_method(x) { Calc.new(OPERATIONS[i], self) }
  end
end

class Calc
  def initialize(*arguments)
    if arguments.size == 2
      @operation = arguments[0]
      @first_number = arguments[1]
    end
  end

  %w(zero one two three four five six seven eight nine).each_with_index do |x,i|
    define_method(x) { perform i }
  end

  def perform(number)
    @operation ? @first_number.send(@operation, number) : number
  end
end
=end
