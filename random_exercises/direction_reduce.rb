#only adjacent pairs must be canceled out 
# then resulting array must be reevaluated
require 'pry'
def dirReduc(arr)
  magic(arr)
end

def magic(arr)
  temp = arr.each_with_index.map do |x,i|
    if x == "NORTH"
      arr[i+1] == "SOUTH" ? (x,arr[i+1] = "","") : x
    elsif x == "SOUTH"
      arr[i+1] == "NORTH" ? (x,arr[i+1] = "","") : x
    elsif x == "WEST"
      arr[i+1] == "EAST" ? (x,arr[i+1] = "","") : x
    elsif x == "EAST"
      arr[i+1] == "WEST" ? (x,arr[i+1] = "","") : x
    else
      ""
    end
  end
  temp = temp.flatten.delete_if {|x| x == ""}
  magic(arr)
end

test = ["NORTH", "SOUTH", "EAST", "SOUTH", "NORTH", "WEST", "EAST", "SOUTH"]
p dirReduc(test)