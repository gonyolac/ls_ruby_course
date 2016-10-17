def max_rot(number)
  rotations = [number]
  base_number = number.to_s
  counter = 0
  until base_number.size - 1 == counter
    base_number << base_number.slice!(counter)
    rotations << base_number.to_i
    counter += 1 
  end
  rotations.max
end
