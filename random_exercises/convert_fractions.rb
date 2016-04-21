require 'pry'
def convertFracts(lst)
  numers = lst.map{|x| x[0]} 
  denoms = lst.map{|x| x[1]}
  final_denom = denoms.reduce(:lcm) 
  result = denoms.zip.map do |x|
    x << (final_denom / x[0])
    x << final_denom
  end
  binding.pry
  numers.zip(result.each {|x| x.shift}).map{|x| x.flatten}.map do |x|
    a = x[0]*x[1]
    b = x[2]
    [a, b]
  end
end

p convertFracts([[2, 7], [1, 3], [1, 12]])

