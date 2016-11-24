#t = distance limit
#k = no of towns
#ls = town distances list

def choose_best_sum(t, k, ls)
  temp = ls.combination(k).to_a.map {|x| x.reduce(:+)}.select{|x| x < t + 1}.max
end

ts = [50]
p choose_best_sum(163, 3, ts)







