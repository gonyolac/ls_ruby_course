class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end


bruno = GoodDog.new("brown")

p bruno.inspect

test = BadDog.new(2, "bear")

p test.inspect


