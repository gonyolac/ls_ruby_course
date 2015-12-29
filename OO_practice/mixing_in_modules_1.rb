module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable 
end

sparky = Dog.new
nemo = Fish.new
miko = Cat.new

p sparky
p nemo
p miko

# (function) + able = naming convention for modules
# modules = functions added to specific classes; often sourced from other classes



