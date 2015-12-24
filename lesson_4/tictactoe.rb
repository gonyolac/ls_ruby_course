require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = "O"
BEST_FIRST_MOVE = 5

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  p "==> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You are X. Computer is O."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, str1 = ',' , str2 = ' or ')
  i = arr.index(arr.last)
  if arr.length > 1 
    arr[0..i-1].join(', ') << str1 << str2 << arr.last.to_s
  else 
    arr[0]  
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if  empty_squares(brd).include?(square)
    prompt "Invalid square choice"
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2 &&
     board.values_at(*line).count(INITIAL_MARKER) == 1
     board.select { |k, v| line.include?(k) && v = INITIAL_MARKER}.key(INITIAL_MARKER)
  else         
    nil
  end     
end  

def find_best_move(line, board)
  if board.values_at(*line).count(COMPUTER_MARKER) == 2 &&
     board.values_at(*line).count(INITIAL_MARKER) == 1
     board.select { |k,v| line.include?(k) && v = INITIAL_MARKER}.key(INITIAL_MARKER)
  else
    nil
  end
end 

def is_slot_five_empty?(brd)
  if brd[5] == ' '
    return true
  end   
end

def computer_places_piece!(brd)
  square = nil

  if is_slot_five_empty?(brd) == true 
    square = BEST_FIRST_MOVE
  end     

  if !square
    WINNING_LINES.each do |line|
      square = find_best_move(line, brd)
      break if square
    end
  end

  if !square 
    WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square 
    end 
  end 

  if !square
    square = empty_squares(brd).sample
  end  
  
  brd[square] = COMPUTER_MARKER  
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
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

def alternate_player(player)
  if player == "Player"
    current_player = "Computer"
  else
    current_player = "Player"
  end
end

def place_piece!(brd, player)
  if player == "Player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end 
end


player_wins = 0
computer_wins = 0
current_player = ''

loop do
  loop do 
    prompt "(Player) first or (Computer) first: "
    answer = gets.chomp
    if answer.downcase.start_with?('p')
      current_player = "Player"
      break
    elsif answer.downcase.start_with?('c')
      current_player = "Computer"
      break
    else 
      prompt "Enter valid option!"  
    end
  end 

  board = initialize_board

  loop do
    display_board(board)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_wins += 1 
    else
      computer_wins += 1 
    end 
  else
    prompt "It's a tie!"
  end

  prompt("Player wins: #{player_wins}")
  prompt("Computer wins: #{computer_wins}")
  series_break_test = series_win(player_wins, computer_wins)
  break if series_break_test == 1 || series_break_test == 0 

  prompt "Play again? (yes or no)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe!"
