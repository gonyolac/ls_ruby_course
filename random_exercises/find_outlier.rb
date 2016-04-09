def find_outlier(integers)
  test = integers.select{|x| x.even?}
  test.size == 1 ? test[0] : (integers - test)[0]
end

p find_outlier([2,6,8,10,3])