def rotate90(matrix)
  new_matrix = []
  0.upto(matrix[0].size-1).each do |y|
    new_matrix << (0..matrix.size-1).map {|x| matrix[x][y]}.reverse
  end
  new_matrix
end

=begin

# original loop-based solution
def rotate90(matrix)
  counter = 0
  new_matrix = []
  loop do
    break if counter == matrix[0].size
    counter2 = 0
    temp = []
    loop do
      break if counter2 == matrix.size
      temp << matrix[counter2][counter]
      counter2 += 1
    end
    new_matrix << temp.reverse
    counter += 1
  end
  new_matrix
end
=end
