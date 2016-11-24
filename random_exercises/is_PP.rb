def isPP(n)
  proof = []
  start = 2
  loop do
    test = Math.log(n,start)
    test.round(2) == test.round ? proof << [start, test.round] : nil
    start += 1
    break if !proof.empty? || start == n
  end
  proof.empty? ? nil : proof.flatten
end

p isPP(rand(1000..65000))