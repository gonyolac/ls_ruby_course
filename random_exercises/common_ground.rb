def common_ground(s1, s2)
  test = s1.split(' ')
  filter = s2.split(' ').select {|x| test.include?(x)}
  filter.empty? ? 'death' : filter.join(" ")
end