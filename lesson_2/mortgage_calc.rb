
loop do 
  puts "Welcome to the Loan/Mortgage Calculator"

  #Required information from user inputs  
  #Fix error conditions (i.e. negative values, empty input)
  loan_amount = ''
  loop do 
    puts "Input the loan amount: "
    loan_amount = gets.chomp.to_f
    if loan_amount.to_s.empty? || loan_amount < 0 
      puts "Enter a valid loan amount"
    else 
      break
    end   
  end    

  a_rate = ' '
  loop do 
    puts "Input Annual Percentage Rate (APR in percent): "
    a_rate = gets.chomp.to_f
    if a_rate.to_s.empty? || a_rate < 0 
      puts "Enter a valid APR"
    else 
      break
    end     
  end 

  y_duration = ''
  loop do 
    puts "Input loan duration (in years): " 
    y_duration = gets.chomp.to_i
    if y_duration.to_s.empty? || y_duration < 0 
      puts "Enter a valid loan duration"
    else 
      break
    end     
  end 

  #things to calculate
  m_rate = a_rate / 1200 

  m_duration = y_duration * 12 

  puts "Calculating monthly payment amount..."
  #formula is Payment = (Loan Amount)[c(1+c)^n]/[(1+c)^n - 1]
  X = (1 + m_rate)**m_duration #(1+c)^n
  value_above = loan_amount * X * m_rate 
  value_below = X - 1 
  result = (value_above / value_below).to_f.round(2)

  #final calculation 

  puts "Total monthly payment of ==> #{result} per month <== to repay loan in #{y_duration} years at #{a_rate}%"
  #return result 
  #perform recalc loop (see calculator.rb)
  puts "Do another loan calculation? (Y to calculate again)"
  answer = gets.chomp 
  break unless answer.downcase().start_with?('y')
end 
  
  puts "==> Calculator Shutdown <=="