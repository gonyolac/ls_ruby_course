class RunLengthEncoding
  def self.encode(data)
    base = data.split('')
    temp = base.each_with_index.map{|x, i| base[i] == base[i+1] ? x : x + ','}
    temp.join('').split(/,/).map{|x| x.size == 1 ? x[0] : x.size.to_s + x[0]}.join('')
  end

  def self.decode(data)
    base = data.split('')
    modified = base.each_with_index.map {|x, i| x =~ /\D/ ? (base[i-1] =~ /\d/ ? x : "1" + x) : x }
    counts = modified.join('').split(/\D/)
    binding.pry
    data_points = modified.join('').split(/\d/).select {|x| x != ''}
    data_points.each_with_index.map{|x, i| x * counts[i].to_i}.join('')
  end
end