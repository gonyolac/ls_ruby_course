module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end

  def self.out_of_place_method(num)
    num ** 2 
  end
end

balto = Mammal::Dog.new
kitty = Mammak::Cat.new
buddy.speak('Arf!')
kitty.say_name('kitty')

value = Mammal.out_of_place_method(4)
