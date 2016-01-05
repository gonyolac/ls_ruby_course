class Animal
  def initialize(name)
    @name = name # initialize instance variables (@test) before referencing
  end
end

module Swim
  def enable_swimming
    @can_swim = true
  end
end


class Dog < Animal
  include Swim

  def initialize(name); end  # <--- passes thru to this initialize (remember inheritance hierarchy)

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

_________________________________

class Animal
  @@total_animals

  def initialize
    @@total_animals += 1
  end
end

class Dog < Animal
  def total_animals
    @@total_animals
  end
end

spike = Dog.new
spike.total_animals # => 1

# class variable tracking

class Vechicle
  @@wheels = 4

  def self.wheels
    @wheels
  end
end

class Motorcycle < Vehicle
  @@wheels = 2 # affects original class variable declared in parent class
end

Vehicle.wheels # => 2; returns 2 instead of 4 since new @@wheels overrided it (in hierarchy terms) 

_________________________________

class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS # added code to access LEGS constant from Dog class
    LEGS
  end
end

kitty = Cat.new
kitty.legs # => 4; originally returns NameError w/o mod

_________________________________

module Maintenance
  def change_tires
    "Changing #{Vehicle::WHEELS} tires." # added Vehicle:: to allow WHEELS constant access; alternative = Car::
  end
end

class Vehicle
  WHEELS = 4 
end

class Car < Vehicle
  include Maintenance

  def self.wheels
    WHEELS
  end

  def wheels
    WHEELS
  end
end

Car.wheels

a_car = Car.new
a_car.wheels # => 4; constants declared in parent (super-) class is inherited by sub-classes, fully-accessible
a_car.change_tires # => NameError; WHEELS constant not 'simply' accessible to module method (w/o :: within the module)





























