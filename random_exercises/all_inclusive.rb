=begin // alternate solution
def contain_all_rots(strng, arr)
  # return array of possible 'rotations' of a string
  if strng.size == 0
    return true
  else
    all_chars = strng.split('')
    string_of_rotations = ''
    counter = 0
    until counter == strng.size do
      first_char = all_chars.shift
      test = all_chars << first_char 
      string_of_rotations += test.join + ' '
      counter += 1
    end
    all_rotations = string_of_rotations.split(' ')
    # determine if each of the rotations are included in arr
    final_test = all_rotations.map {|x| arr.include?(x)}
    final_test.include?(false) ? false : true
  end
end
=end

def contain_all_rots(strng, arr)
  (((1..strng.size).map {|x| strng.split('').rotate(x).join()}) - arr).empty? ? true : false
end
