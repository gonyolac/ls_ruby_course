require 'pry'
def find_nb(m) # should return the n in the summation
  sequence = [1]
  # increment the last element of the sequence
  # have a separate aggregate/counter for summation
  summation = 1

  until summation == m || summation > m 
    next_value = sequence.last + 1
    summation += (next_value ** 3)
    sequence << next_value
  end

  summation == m ? sequence.last : -1 
end
