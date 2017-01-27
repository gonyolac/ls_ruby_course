def vampire_test(a,b)
  (a * b).to_s.chars.sort == (a.to_s + b.to_s).chars.sort
end

p vampire_test(204, 615)