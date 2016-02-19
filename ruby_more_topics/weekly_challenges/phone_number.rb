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
    @verified_no = []
    @area_code = []
  end

  def number
    trimmed_no = @input_number.tr(' ()-.','')

    test = trimmed_no.size

    case test
    when 10
      trimmed_no = trimmed_no.tr('abcdefghijklmnopqrstuvwxyz','')
      if trimmed_no.size == 10
        @verified_no << trimmed_no
        string(@verified_no)
      else
        INVALID_NUMBER
      end
    when 11
      temp = trimmed_no.split('')
      if temp[0] == '1'
        temp.shift
        trimmed_no = string(temp)
        @verified_no << trimmed_no
        string(@verified_no)
      else
        INVALID_NUMBER
      end
    else
      INVALID_NUMBER
    end
  end

  def area_code
    number
    if string(@verified_no) != INVALID_NUMBER
      temp = @verified_no.join('').split('')
      @area_code << string(temp[0..2])
      string(@area_code)
    else
      INVALID_NUMBER
    end
  end

  def to_s
    number
    area_code
    temp = string(@verified_no)
    '(' + string(@area_code) + ') ' + temp[3..5] + '-' + temp[6..9]
  end

  private

  def string(array)
    array.join('')
  end
end
