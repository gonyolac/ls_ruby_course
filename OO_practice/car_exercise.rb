class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize (year, model, color) 
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You accelerate and speed up to #{number} mph."
  end

  def brake
    @current_speed -= number
    puts "You deccelerate and slow down to #{number} mph."
  end

  def shut_off
    @current_speed = 0
    puts 'You park the car.'
  end

  def spray_paint(color)
    self.color = color 
    puts "You new #{color} paint job looks great!"
  end

  def self.calculate_gas(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "My car is a #{color}, #{year}, #{model}"
  end

end

accord = MyCar.new(2012, 'honda accord', 'white')
accord.spray_paint('red')
MyCar.calculate_gas(13, 351)
puts my_car

