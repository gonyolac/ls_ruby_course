=begin
 S-E-A-T Approach to testing

 1. Setup the necessary objects
 2. Execute the code against the object we're testing
 3. Assert the results of the execution
 4. Tear down and clean up any lingering artifacts 

=end

require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    # initialize equivalent of tests
    @car = Car.new
  end

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do 
      car = Car.new(name: "Joey")
    end
  end

  def assert_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end

  # teardown method here; called to clean up files or 
  # logging information or closing database connections
end
