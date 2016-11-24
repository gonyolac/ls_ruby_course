require 'pry'

def decompose(n, t = nil)
  t = n**2 if t.nil?  # only runs at first; superseded by given t value from z (line 11)
  (n-1).downto(1) do |x| 
    y = x * x 
    next if y > t # breaks out of top level recursion loop
    return x if y == t
    z = decompose(x, t - y) # runs when y < t; new t value is setup for recursion
    next if z.nil?  # z returns nil from at 1<n<4
    return [z,x].flatten
  end
  return nil  # returns nil if entire recursion fails(?)
end

p decompose(50)