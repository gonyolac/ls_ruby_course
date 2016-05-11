require 'pry'
def shuffle_it(*arr)
  base = arr[0]
  if arr.size > 1
    (1..arr.size-1).to_a.each do |x|
      first_index = arr[x][0]
      second_index = arr[x][1]
      a = base[first_index]
      b = base[second_index]
      base[first_index] = b
      base[second_index] = a
    end
    base
  else
    arr[0]
  end
end

p shuffle_it([1,2,3,4,5],[1,2],[3,4],[2,3])

=begin
#Optimal solution Magic

def shuffle_it(arr,*params)
  params.each { |p| arr[p[0]], arr[p[1]] = arr[p[1]], arr[p[0]] }
  arr
end  
=end