module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def initialize
    @test = ''
  end

  def speak 
    "I'm an animal, and I speak!"
  end
end

puts "---Animal method lookup---"
puts Animal.ancestors

# fido = Animal.new
# p fido.speak
# p fido.swim

class GoodDog < Animal
  include Swimmable
  include Climable
end
