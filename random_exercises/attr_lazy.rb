require 'pry'

module AttrLazy
  def attr_lazy(name, &block)
    var_name = "@#{name.to_s.gsub('?','')}"
    define_method name do
      instance_variable_defined?(var_name) ? instance_variable_set(var_name) : instance_variable_set(var_name, instance_eval(&block))
    end
  end
end

class Numbers
  extend AttrLazy
  
  def initialize(*numbers)
    @numbers = numbers
  end
  
  attr_lazy :evens do
    @numbers.select(&:even?) 
  end
  
  attr_lazy :even? do
    @numbers.all?(&:even?)
  end
  
  def mark_even
    @even = true
  end
end

test = Numbers.new(1,2)
p test.evens


