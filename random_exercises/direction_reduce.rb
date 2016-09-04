#python runserver.py -a ptc -u cmartin0001 -u cmartin0003 -u cmartin0004 -u cmartin0005 -u cmartin0006 -u cmartin0007 -u cmartin0008 -p 36y808vw -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l '-6.207099, 106.810187' -st 10 -sd 8

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