# The program will first randomly pick a number between 1 and 100. The program will then ask the user to guess the number. If the user guesses correctly, the program will end. If the user guessed too high or low, the program will respond with "Your number is to high" or "Your number is to low" respectively, and allow the user to guess again. After finally guessing the number, the program will display how many guesses the user took to guess the number.

def compare_number(computer, player)
  if player < computer
    puts "Too Low"
  elsif player > computer
    puts "Too High"
  else
    puts "Match"
  end
end

computer_number = (1..100).to_a.sample
counter = 0
loop do
  puts "Pick a number:"
  player_input = gets.chomp.to_i
  counter += 1
  compare_number(computer_number, player_input)
  if computer_number == player_input
    puts "Number of Tries: #{counter}"
    break
  end
end



