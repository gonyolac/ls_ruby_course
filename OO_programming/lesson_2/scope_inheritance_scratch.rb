class Animal
  def initialize(name)
    @name = name
  end
end

module Swim
  def enable_swimming
    @can_swim = true
  end
end


class Dog < Animal
  include Swim

  def initialize(name); end  # <--- goes to this initialize (remember ancestors)

  def swim
    "swimming!" if @can_swim
  end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
teddy.enable_swimming
puts teddy.swim

# for module instance variables, call the method in the module first before accessing 

