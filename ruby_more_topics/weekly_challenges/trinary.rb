class Trinary
  def initialize(number)
    number =~ /\D/ ? @number = '0' : @number = number
  end

  def to_decimal
    number_arr = @number.split('')
    to_sum_array = []
    counter = 0
    equivalents = number_arr.each do |x|
      to_sum_array << x.to_i * (3**(@number.size - counter - 1))
      counter += 1
    end
    to_sum_array.inject(:+)
  end
end
