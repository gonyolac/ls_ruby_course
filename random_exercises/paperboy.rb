require 'pry'
def cheapest_quote(n)
  current_quote = 0

  until n == 0 do
    if n / 40 != 0
      current_quote += (3.85 * (n/40))
      n = n - (40 * (n/40))
    elsif n / 20 != 0
      current_quote += (1.93 * (n/20))
      n = n - (20 * (n/20))
    elsif n / 10 != 0
      current_quote += (0.97 * (n/10))
      n = n - (10 * (n/10))  
    elsif n / 5 != 0
      current_quote += (0.49 * (n/5))
      n = n - (5 * (n/5))  
    else
      current_quote += (0.10 * n)
      n = 0         
    end
  end
  current_quote.round(2)
end