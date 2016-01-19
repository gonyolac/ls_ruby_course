=begin
Nouns: board, player, square, grid
Verbs: play, mark

board
square
player
  - mark
  - play
________________________

 obsolete methods from item #9 refactoring. under board class
  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end
=end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  | #{@squares[3]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  | #{@squares[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  | #{@squares[9]}"
    puts "     |     |"
  end
  #rubocop:enable Metrics/Abcsize

  def get_square_at(key) # returns a Board object; !!obsolete after refactoring
    @squares[key]
  end

  def []=(num, marker) # refactored from set_square_at
    @squares[num].marker = marker
    # places corresponding marker to default blank marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
    # returns empty keys in an array
  end

  def full?
    unmarked_keys.empty?
    # if return array is empty, then slots are full
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker # return the corresponding detected marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private # method breakdown in item #9

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker
  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  BOT_NAMES = ["R2D2", "C3PO", "BB8"] 

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new # represents board state
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @human_wins = 0
    @computer_wins = 0
    @human_name = ''
    @computer_name = ''
  end

  def play
    display_welcome_message
    set_names
    loop do
      clear_screen_and_display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        display_board
      end
      display_result
      display_wins
      break if five_wins? || play_again? == false
      reset
      play_again_message
    end
    display_goodbye_message
  end

  private

  def set_names
    human_name
    computer_name
  end

  def human_name
    loop do
    puts "Input your name: "
    @human_name = gets.chomp
    break if @human_name.size > 0
    puts "Please input a valid name"
    end
  end

  def computer_name
    @computer_name = BOT_NAMES.sample
  end

  def five_wins?
    if @human_wins == 5
      puts "#{@human_name} wins the series!"
      return true
    elsif @computer_wins == 5
      puts "#{@computer_name} wins the series!"
      return true
    end
  end

  def display_wins
    win_counter
    puts "#{@human_name} wins: #{@human_wins}"
    puts "#{@computer_name} wins: #{@computer_wins}"
  end

  def win_counter
    case display_result
    when 1
      @human_wins += 1
    when 0
      @computer_wins += 1
    end 
  end

  def current_player_moves
    if @current_marker == HUMAN_MARKER
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing!'
  end

  def clear
    system 'clear'
  end

  def display_board
    puts "You're #{human.marker}. #{@computer_name} is #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square between #{board.unmarked_keys.join(', ')}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts 'Sorry, select a valid choice.'
    end
    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    display_board

    case board.winning_marker
    when human.marker
      puts 'You won!'
      return 1
    when computer.marker
      puts '#{@computer_name} won!'
      return 0
    else
      puts "It's a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Do you wanna play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, select y or n'
    end

    if answer == 'y'
      return true
    else
      return false
    end
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def play_again_message
    puts "Let's play again!"
    puts ''
  end
end

game = TTTGame.new
game.play




