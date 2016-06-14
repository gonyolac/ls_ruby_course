=begin
Orthus" is a 2 headed dog with 1 tail. The mighty "Hydra" has 5 heads and 1 tail.

2H - 1T
5H - 1T
=end
require 'pry'
def beasts(heads,tails)
  @heads = heads
  @tails = tails
  hydras = 0
  orthi = 0

  if (@heads / 2 != 0)
    orthi += @heads / 2 
    @heads -= (orthi)*2
    @tails -= orthi
  end
  binding.pry
  if (@heads / 5 != 0)
    hydras += @heads / 5
    @heads -= (hydras)*5
    @tails -= hydras
  end

  if @tails == 0 && @heads == 0
    [orthi, hydras]
  else
    "No solutions"
  end
end 

p beasts(123,39)