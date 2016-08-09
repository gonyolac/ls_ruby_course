def egyptian(rational)
  counter, denoms, current_sum = 1, [], 0
  loop do
    break if current_sum == rational
    if current_sum + Rational(1,counter) <= rational 
      denoms << counter
      current_sum += Rational(1,counter)
    end
    counter += 1 
  end
  denoms
end

def unegyptian(denoms)
  denoms.map {|x| Rational(1,x)}.inject(:+)
end

