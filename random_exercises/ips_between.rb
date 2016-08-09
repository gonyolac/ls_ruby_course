def ipsBetween(start, ending)
  base_ip, end_ip = start.split('.').map {|x| x.to_i}, ending.split('.').map {|x| x.to_i}
  temp = end_ip.zip(base_ip).map {|x| x[0] - x[1]}
  temp.each_with_index.map {|x, i| x * 256 ** (temp.size - (i+1))}.reduce(&:+)
end


p ipsBetween("20.0.0.10", "20.1.2.0")