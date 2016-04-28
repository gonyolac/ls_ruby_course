require 'pry'

class Triangle
  def initialize(number_of_rows)
    @number_of_rows = number_of_rows
  end

  def rows
    sequence = []
    counter = 0
      until counter == @number_of_rows do 
        sequence << next_row(counter)
        counter += 1
      end
    sequence
  end

  private

  def next_row(row_number)
    row_array = [1]
    counter = 1
    until counter == row_number + 1 do
      value = combination(row_number, counter)
      row_array << value
      counter += 1
    end
    row_array
  end

  def combination(n, r)
    factorial(n) / (factorial(r) * factorial(n - r))
  end

  def factorial(number)
    number == 0 ? 1 : number.downto(1).inject(:*)
  end
end
