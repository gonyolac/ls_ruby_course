class MethodError < StandardError
end

module Kernel
  def self.rand(num=0)
    raise MethodError, "Invalid Method Use"
  end

  def self.srand(num=0)
    raise MethodError, "Invalid Method Use"
  end
  
  def rand(num=0)
    raise MethodError, "Invalid Method Use"
  end

  def srand(num=0)
    raise MethodError, "Invalid Method Use"
  end
end

class Random
  def self.rand(num=0)
    raise MethodError, "Invalid Method Use"
  end

  def self.srand(num=0)
    raise MethodError, "Invalid Method Use"
  end

  def rand(num=0)
    raise MethodError, "Invalid Method Use"
  end
end

class Array
  def shuffle
    raise MethodError, "Invalid Method Use"
  end

  def sample
    raise MethodError, "Invalid Method Use"
  end
end

=begin
# most efficient solution
[Random.singleton_class, Random, Kernel.singleton_class, Kernel].each do |klass|
  [:rand, :srand].each {|method| klass.send :undef_method, method}
end  

[:sample, :shuffle].each {|method| Array.send :undef_method, method }
=end
