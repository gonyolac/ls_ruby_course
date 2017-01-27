CODEX = "ZYXWVUTSRQPONMLKJIHGFEDCBA9876543210".reverse.chars.freeze

def dec2FactString(number)
  # find out the next valid such that factorial < number
  # LIMIT : valid n in n x f! is (1..n) 
  @number = number
  fact_string = []

  max = 0
  CODEX.each_with_index do |x, i|
    i == 0 ? factorial_total = 1 : factorial_total = (1..i).inject(:*) 
    factorial_total >= @number ? max = i - 1 : (i == 35 ? max = 35 : nil)
    break if max > 0
  end

  until max == 0
    fact_string << @number / (1..max).inject(:*)
    @number -= (@number / (1..max).inject(:*)) * (1..max).inject(:*)
    max -= 1
  end
  (fact_string << 0).map {|x| CODEX[x.to_i]}.join
end

def factString2Dec(str)
  str.chars.reverse.map.with_index {|x,i| i == 0 ? 0 : CODEX.index(x) * (1..i).inject(:*)}.reduce(:+)
end

p dec2FactString(463)
