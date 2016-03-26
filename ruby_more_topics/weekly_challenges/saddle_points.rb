# saddle point = coords of number in a matrix such that:
#                MIN in its COLUMN
#                MAX in its ROW
# return all possible saddle points in given matrix
# matrix.rows.class => Array

require 'pry'

class Matrix
  def initialize(matrix_string)
    @matrix_string = matrix_string.split("\n").map do |x| 
      x.split(' ').map {|x| x.to_i}
    end
  end

  def rows
    @matrix_string
  end

  def columns
    @matrix_string.transpose
  end

  def saddle_points
    row_maxes = []
    column_mins = []

    rows.each {|x| row_maxes << x.max}
    columns.each {|x| column_mins << x.min}

    y_coords = column_mins.map.with_index{|x, i| row_maxes.index(x) ? i : x = nil}
    x_coords = row_maxes.map.with_index {|x, i| column_mins.index(x) ? i : x = nil}

    y_coords.delete(nil)
    x_coords.delete(nil)

    zipped_x = x_coords.zip
    zipped_y = y_coords.zip
    coords_list = zipped_x.product(zipped_y).map {|x| x.flatten}
  end
end
