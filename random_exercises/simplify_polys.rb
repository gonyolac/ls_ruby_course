require 'pry'
def
  # account for negatives trick
  poly.gsub!('-','-_')
  # split polynomial by operation
  variables = poly.split(/\W/).reject {|x| x == ""}
  hash = {}

  variables.each do |x|

    # extracting the coefficient and setting the variable
    coefficient = x.gsub(/\D/,"")
    coefficient == "" ? coefficient = 1 : coefficient = coefficient.to_i
    x.include?("_") ? coefficient *= -1 : nil
    #sort the variable 'internally'
    variable = x.gsub(/[^a-z]/,'').chars.sort.join

    if hash.has_key?(variable)
      hash[variable][:value] += coefficient
    else
      hash[variable] = {:value => coefficient}
    end
  end
  
  hash.each_key do |key| 
    hash[key][:value] < 0 ? sign = '-' : sign = "+"
    hash[key][:sign] = sign
  end

  output = ""

  #sort variables by number of variables -> lexicographic
  Hash[hash.sort_by {|key, val| [key.size, key]}].each do |key, value|
    n = value[:value]
    next if n == 0
    n.abs == 1 ? output << "#{value[:sign]}#{key}": output << "#{value[:sign]}#{n.abs}#{key}"
  end

  output[0] == '+' ? output[1..-1] : output
end

test = "-a+5ab+3a-c-2a"

p simplify(test)

=begin
# use hash structure 
# every variable is a key
# create new key (with hash as its value with a new_hash[:value]) 
# if hash[:key].nil? else increment 
# current value based on coefficient
# corresponding values per key is coefficient
{
  "xy" => {value: 4},
  ...
}
=end