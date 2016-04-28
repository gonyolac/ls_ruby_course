require 'pry'

class Triangle
  def initialize(number_of_rows)
    @number_of_rows = number_of_rows
  end

  def rows
    sequence = Array.new(@number_of_rows) { |x| x = Array.new(x + 1, 1) }
    2.upto(sequence.size - 1) do |y|
      1.upto(sequence[y].size - 2) do |z|
        sequence[y][z] = sequence[y - 1][z] + sequence[y - 1][z - 1]
      end
    end
    sequence
  end
end