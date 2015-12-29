module Raceable
  def race
    "Race the Car!"
  end
end



class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :color
  attr_reader :model, :year

  def initialize (year, model, color) 
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles."
  end

  def self.calculate_gas(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
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

  def age
    "The #{self.model} is #{years_old} years old." 
  end

  private

  def years_old
    Time.now.year - self.year
  end

end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "The truck is a #{self.color}, #{self.year}, #{self.model}."
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4 

  include Raceable

  def to_s
    "The car is a #{self.color}, #{self.year}, #{self.model}."
  end
end

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected
  
  def grade
    @grade
  end

end


  

accord = MyCar.new(2012, 'honda accord', 'white')
accord.spray_paint('red')
MyCar.calculate_gas(13, 351)
puts my_car

puts "---Vehicle Hierarchy---"
puts Vehicle.ancestors
puts "---MyTruck Hierarchy---"
puts MyTruck.ancestors
puts "---MyCar Hierarchy---"
puts MyCar.ancestors

