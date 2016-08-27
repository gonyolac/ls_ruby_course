#python runserver.py -a ptc -u cmartin0001 -u cmartin0003 -u cmartin0004 -u cmartin0005 -u cmartin0006 -u cmartin0007 -u cmartin0008 -p 36y808vw -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l '-6.207099, 106.810187' -st 10 -sd 8

#t = distance limit
#k = no of towns
#ls = town distances list

def choose_best_sum(t, k, ls)
  temp = ls.combination(k).to_a.map {|x| x.reduce(:+)}.select{|x| x < t + 1}.max
end

ts = [50]
p choose_best_sum(163, 3, ts)







