def evaporator(content, evap_per_day, threshold)
  unusable = (threshold.to_f / 100) * content
  days = 0
  until content <= unusable
    content *= 1 - (evap_per_day.to_f / 100)
    days += 1
  end
  days
end

p evaporator(10, 10, 10)