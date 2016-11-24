def convertFracts(lst)
  lcm = lst.map {|x| x[1]}.reduce(:lcm)
  lst.map {|x| [(lcm/x[1]*x[0]),lcm]}
end

p convertFracts([[1, 2], [1, 3], [1, 4]])

[1,4],[4,12],[1,12]