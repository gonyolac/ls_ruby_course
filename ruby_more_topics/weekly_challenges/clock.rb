class Time 
  def to_s
    strftime("%H:%M")
  end

  def + (extra_minutes)
    seconds = self.to_i + (60*extra_minutes)
    Time.at(seconds)
  end

  def - (extra_minutes)
    seconds = self.to_i - (60*extra_minutes)
    Time.at(seconds)
  end
end

class Clock
  def self.at(hour, minute = 0)
    Time.new(2016, 2, 26, hour, minute)
  end
end
