class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end  # <--- goes to this initialize (remember ancestors)

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name

