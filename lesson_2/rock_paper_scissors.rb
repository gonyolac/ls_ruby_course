VALID_CHOICES = %w(rock paper scissors lizard spock)

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) 
end  

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
    return 1
  elsif win?(computer, player)
    prompt("You lose!")
    return 0
  else 
    prompt("It's a tie!") 
  end 
end   

def series_win(player, computer)
  if player == 5
    prompt("You win the series!")
    return 1 
  elsif computer == 5
    prompt("Computer wins the series!")
    return 0 
  end 
end 

def prompt(message)
  Kernel.puts("=> #{message}")
end   

player_win = 0
comp_win = 0

loop do 
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else 
      prompt("Pick a valid choice")
    end 
  end     

  computer_choice = VALID_CHOICES.sample
  Kernel.puts("Computer chose: #{computer_choice}")

  test = display_results(choice, computer_choice)

  if test == 1
    player_win += 1
  elsif test == 0 
    comp_win += 1 
  end  

  prompt("Player wins: #{player_win}")
  prompt("Computer wins: #{comp_win}")
  series_break_test = series_win(player_win, comp_win)
  break if series_break_test == 1 || series_break_test == 0

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end 

prompt("Thanks for playing!")       

