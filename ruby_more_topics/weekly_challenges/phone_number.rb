#If the phone number is less than 10 digits assume that it is bad number
#If the phone number is 10 digits assume that it is good
#If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
#If the phone number is 11 digits and the first number is not 1, then it is a bad number
#f the phone number is more than 11 digits assume that it is a bad number
require 'pry'

class PhoneNumber
  INVALID_NUMBER = '0000000000'
  def initialize(input_number)
    @input_number = input_number
    @verified_no = ''
    @area_code = ''
  end

  def number
    no_symbols = @input_number.tr(' ()-.','')
    # returns phone number without any symbols

    test = no_symbols.size

    case test
    when 10
      no_letters = no_symbols.tr('abcdefghijklmnopqrstuvwxyz','')
      no_letters.size == 10 ? @verified_no = no_letters : INVALID_NUMBER
    when 11
      no_symbols.index('1') == 0 ? @verified_no = no_symbols[1..10] : INVALID_NUMBER
    else
      INVALID_NUMBER
    end
  end

  def area_code
    number
    @area_code = @verified_no[0..2]
  end

  def to_s
    number
    area_code
    '(' + @area_code +') ' + @verified_no[3..5] + '-' + @verified_no[6..9]
  end
end


