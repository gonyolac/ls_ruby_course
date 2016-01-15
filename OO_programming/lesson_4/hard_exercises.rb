class SecretFile
  def initialize(secret_data, log_entry)
    @data = secret_data
    @log = log_entry
  end

  def data
    @log.create_log_entry
    @data
  end

end

class SecurityLogger
  def create_log_entry
  end
end

log = SecurityLogger.new

____________________________________

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity
  
  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array)
    @tires = tire_array
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with
    super([20,20], 80, 8.0)
  end
end

class Boats
  include Moveable
  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    (@fuel_capacity * @fuel_efficiency) + 10
  end

end


class Catamaran < Boats
  # omitted code  
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super
  end
end

class Motorboat < Boats
  # omitted code
  def initialize
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end







