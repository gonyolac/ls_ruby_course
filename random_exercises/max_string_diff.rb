def mxdiflg(a1, a2)
  first = string_check(a2).max - string_check(a1).min
  second = string_check(a1).max - string_check(a2).min

  [string_check(a2).max, string_check(a1).min]
end

def string_check(array)
  array.map do |x|
    x =~ /\w/ ? x.size : 0
  end
end

s1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"]
s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]

p mxdiflg(s1, s2)