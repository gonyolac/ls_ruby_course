# ask the user for two numbers
# ask the user for an operation to perform
# do the operation on the two numbers 
# output the result 

#answer = Kernel.gets().chomp()
#Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end 

def integer?(num)
  num.to_i.to_s == num 
end   

def float?(num)
  num.to_f.to_s == num 
end     

def valid_number?(num)
  integer?(num) || float?(num)      
end  


def operation_to_message(x)
  case x
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiply'
    when '4'   
      'Divide'
  end 
end 

prompt("Welcome to the Calculator! Enter your name: ") 

name = ''
loop do 
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Please enter a valid name")
  else 
    break
  end
end 

prompt("Welcome #{name}")

loop do 

  number1 = ''
  loop do 
    prompt("First number: ")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1) == true   # at this point you already verified input is valid 
      if integer?(number1) == true 
        number1 = number1.to_i
        break
      else 
        number1 = number1.to_f
        break
      end 
    else
      prompt("Enter a valid number") 
    end    
  end 

  number2 = ''
  loop do 
    prompt("Second number: ")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2) == true   # at this point you already verified input is valid 
      if integer?(number2) == true 
        number2 = number2.to_i
        break
      else 
        number2 = number2.to_f
        break
      end 
    else
      prompt("Enter a valid number") 
    end    
  end 

  operator_prompt = <<-MSG
    What operation do you want to perform:

    1)add
    2)subtract
    3)multiply
    4)division
  
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else 
      prompt("Choose 1, 2, 3, or 4: ")
    end
  end        

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator 
              when '1'
              number1 + number2
              when '2'
              number1 - number2
              when '3'
              number1 * number2
              when '4'
              number1 / number2
  end  

  prompt("Result is #{result}")

  prompt("Do you want to do another calculation (Y to calculate again)") 
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end 

  prompt("Thanks for using the calculator!") 


       
