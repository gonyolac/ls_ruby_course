class BankAccount
  attr_reader :balance 
  # automatically creates 'balance' method (returns value of @balance)
  # without attr_reader, alyssa would be right

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

#ben is right
____________________________________

class InvoiceEntry
  attr_reader :quantity, :product_name
  # changing attr_reader to attr_accessor alters the public interfaces of the class
  # allows users to access instance.quantity function to modify values

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0 
  end
end
____________________________________

class Greeting
  def greet(message)
    puts "#{message}"
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
____________________________________

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = @filling_type ? @filling_type : "Plain"
    glazing_string = @glazing ? " with #{glazing}" : ''
    puts filling_string + glazing_string
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

____________________________________

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template # avoid self. when not required
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
    "I want to turn on the light with a brightness level of 
    super high and a colour of green"
  end
end













