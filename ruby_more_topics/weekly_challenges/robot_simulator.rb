class Robot
  VALID_BEARINGS = [:north, :east, :south, :west]
  attr_reader :coordinates, :bearing

  def initialize
    @bearing = ''
    @coordinates = []
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def orient(direction)
    raise ArgumentError if !VALID_BEARINGS.include?(direction) 
    @bearing = direction
  end

  def turn_right
    test = VALID_BEARINGS.index(@bearing) + 1
    test > 3 ? self.orient(:north) : self.orient(VALID_BEARINGS[test])
  end

  def turn_left
    self.orient(VALID_BEARINGS[VALID_BEARINGS.index(@bearing) - 1])
  end

  def advance
    self.coordinates[1] += 1 if self.bearing == :north
    self.coordinates[0] += 1 if self.bearing == :east
    self.coordinates[1] -= 1 if bearing == :south
    self.coordinates[0] -= 1 if bearing == :west
  end
end

class Simulator
  def instructions(actions_string)
    movements = {
      "L" => :turn_left,
      "R" => :turn_right,
      "A" => :advance
    }
    actions_string.chars.map { |x| movements[x] }
  end

  def place(robot, specs)
    robot.at(specs[:x],specs[:y])
    robot.orient(specs[:direction])
  end

  def evaluate(robot, actions)
    instructions(actions).each { |move| robot.send(move)}
  end
end
