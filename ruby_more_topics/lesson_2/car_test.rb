# ASSERT-STYLE SYNTAX

require 'minitest/autorun' # loads minitest gem
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car' # requires the file to be tested (car.rb)

class CarTest < MiniTest::Test 
# must be a subclass of MiniTest::Test, for access to methods
  def test_wheels 
  # actual test (identified by test_*); 
  # need to setup required data/objects to make assertions against
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip 
    # add at the start of the test method to skip particular test
    # can also add string for custom message
    car = Car.new
    assert_equal(3, car.wheels)
  end
end

# it's usually helpful to have multiple assertions within one test (test_*)

=begin
# initial output 

Run options: --seed 62238 
# tells Minitest what order the tests are run in

# Running:

CarTest .
# dot means that the test was run and nothing went wrong
# S for 'skip'; F for 'failure'; E for 'error'

Finished in 0.001097s, 911.3428 runs/s, 911.3428 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips  
# testing summary
=end

#_____________________________________

=begin 
# modified output (w/ intended F)
$ ruby car_test.rb

Run options: --seed 8732

# Running:

CarTest F.

Finished in 0.001222s, 1636.7965 runs/s, 1636.7965 assertions/s.

  1) Failure:
CarTest#test_bad_wheels [car_test.rb:13]:
Expected: 3
  Actual: 4

2 runs, 2 assertions, 1 failures, 0 errors, 0 skips
=end

#_____________________________________

# SPEC-STYLE SYNTAX

require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4
  end
end


