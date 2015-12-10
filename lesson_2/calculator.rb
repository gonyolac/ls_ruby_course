# ask the user for two numbers
# ask the user for an operation to perform
# do the operation on the two numbers 
# output the result 

#answer = Kernel.gets().chomp()
#Kernel.puts(answer) 

Kernel.puts("Welcome to the Calculator!") 

Kernel.puts("First number: ")
number1 = Kernel.gets().chomp()

Kernel.puts("Second number: ")
number2 = Kernel.gets().chomp()

Kernel.puts("Select an operation: 1. add, 2. subtract, 3. multiply or 4. divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i + number2.to_i
  puts "Sum is: " + result 
elsif operator == '2'
  result = number1.to_i - number2.to_i
  puts "Difference is: " + result  
elsif operator == '3'
  result = number1.to_i * number2.to_i 
  puts "Product is: " + result
elsif operator == '4'  
  result = number1.to_f / number2.to_f
  puts "Quotient is: " + result.to_s
else 
  puts "Thanks!"
end



       
