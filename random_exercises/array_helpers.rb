class Array
  def square
    self.map {|x| x**2} 
  end

  def cube
    self.map {|x| x**3}
  end

  def average
    self.empty? ? "NaN" : self.inject(:+) / self.size
  end

  def sum
    self.inject(:+) 
  end

  def even
    self.select {|x| x.even?}
  end

  def odd
    self.select {|x| x.odd?}
  end
end
