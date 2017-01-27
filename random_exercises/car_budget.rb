require 'pry'
def nbMonths(startPriceOld, startPriceNew, savingperMonth, percentLossByMonth)
  @startPriceOld, @startPriceNew = startPriceOld, startPriceNew
  @percentLossByMonth = percentLossByMonth * 0.01
  funds, months = 0, 0

  loop do
    break if @startPriceOld + funds >= @startPriceNew
    months.odd? && months > 0 ? @percentLossByMonth += 0.005 : nil
    funds += savingperMonth
    @startPriceOld *= (1 - @percentLossByMonth)
    @startPriceNew *= (1 - @percentLossByMonth)
    months += 1
  end
  
  [months, (@startPriceOld + funds - @startPriceNew).round]
end

# oldcar = $2000 || decrease of 1.5 percent per month <-- increases 0.5 percent every 2 months 
# newcar = $8000 || decrease of 1.5 percent per month <-- increases 0.5 percent every 2 months
# save $1000 per month

# should return [n months, leftover cash]
