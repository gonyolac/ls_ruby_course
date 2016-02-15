# assert_equal tests for value equality; ==
# assert_same for object equality


require 'minitest/autorun'
=begin
class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"

    assert_equal(str1, str2)
    assert_same(str1, str2)
  end
end
=end

# ruby standard library implements == to test for value equality

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)
    name == other.name
  end
end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
    assert_same(car1, car2) # still fails since it tests if it's the same object
  end
end

# before == method addition
# note the error message: tells us to implement an instance method == in Car class
# Minitest cannot andle assert value equality in this case

