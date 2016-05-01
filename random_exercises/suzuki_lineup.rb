require 'pry'
def lineup_students(students)
  name_arr = students.split(' ')
  largest = name_arr.map {|x| x.size}.max
  smallest = name_arr.map {|x| x.size}.min
  empty = []
  (smallest..largest).each_with_index do |x, idx|
    name_arr.select {|y| y.size == x}.empty? ? "nothing" : empty << name_arr.select {|y| y.size == x}
  end
  empty.reverse.map {|x| x.sort.reverse}.flatten
end

#optimal solution
#def lineup_students(students)
#  students.split.sort_by { |name| [name.length, name] }.reverse
#end
