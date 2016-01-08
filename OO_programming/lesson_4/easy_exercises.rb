module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end


class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end


test_car = Car.new("Aston Martin DBS")
test_truck = Car.new("Durango")

test_car.go_fast
test_truck.go_fast

____________________________________

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

miko = AngryCat.new("Miko")

____________________________________

class Cube 
  def initialize(volume)
    @volume = volume
  end

# to access instance variable
  def get_volume
    @volume
  end
end

____________________________________

class Cat
  attr_accessor :type, :age
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def make_one_year_older
    # self.age refers to the @age of a class object that called the method
    self.age += 1 
  end

  def self.cats_count
    @@cats_count
  end

end

# @@cats_count explanation
=begin
 @@cats_count is a class variable; it increments each time a new object
 of the Cat class is initialized. To test the code, create a new object 
 test_cat = Cat.new("Siamese"), then call Cat.cats_count to return current 
 count


=end

____________________________________

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

test_bag = Bag.new("red", "leather")

____________________________________

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new 
oracle.predict_the_future

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
# returns values under defined 'choices' under RoadTrip (see lookup chain)
trip.predict_the_future 


____________________________________

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

test.ancestors

____________________________________

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end


____________________________________

excited_dog # local variable
@excited_dog # instance variable
@@excited_dog # class variable

____________________________________

class Television
  def self.manufacturer # class method
    "test logic"
  end

  def model
    "test logic"
  end
end

Television.manufacturer

____________________________________

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game 
# make Game class the superclass for Bingo (to inherit play method)
  def rules_of_play
    #rules of play
  end

  def play
    # adding another play method will override the one under game (as per lookup chain)
    "Eyes Down" 
  end
end

____________________________________

=begin
  Q: What are the benefits of using Object Oriented Programming in Ruby?
  
  Create objects that allow programmers to think more abstractly about the code
  Objects are represented by nouns are easier to conceptualize
  Flexible method implementation and function; Reusable code
  Avoid redundand methods
  As the software becomes more complex, the code can easily be managed
=end
____________________________________

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new 
# case 1 
hello.hi # => puts "Hello"

# case 2
hello.bye # => undefined method error (since hello is an object of Hello class)

# case 3
hello.greet # => 0 for 1 error (no message on greet method call)

# case 4 
hello.greet("Goodbye") # => puts "Goodbye"

# case 5 
Hello.hi # => undefined method error (since hi is an instance, NOT CLASS, method for Hello class)

____________________________________

class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hissssss!!!"
  end
end

mew = AngryCat.new(8, "Mew")
mewtwo = AngryCat.new(5, "Mewtwo")

____________________________________

class Cat
  def initialize(type)
    @type = type
  end

  def display
    "I am a #{type} cat"
  end
end

tabby = Cat.new("tabby")

____________________________________

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # undefined method error (since manufacturer is a class method)
tv.model # runs the method

Television.manufacturer # runs the method
Television.model # undefined method (since model is an instance method)

____________________________________

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    @age += 1 # originally self.age (@ and self. are interchangeable, in this case)
  end
end

____________________________________

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness 
    level of super high and a colour of green." 
    # return is unecessary since Ruby automatically returns 
    # the last line of any method
  end
end

