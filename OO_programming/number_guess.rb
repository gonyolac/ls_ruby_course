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



