class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors' # validates if current value is R, P or S
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end


  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (spock? && (other_move.rock? || other_move.scissors?)) ||
      (lizard? && (other_move.paper? || other_move.spock?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (spock? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.rock? || other_move.scissors?))
  end

  def to_s
    @value
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "Input your name:"
      n = gets.chomp
      break unless n.empty?
      puts "Name cannot be blank"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Choose one: Rock, Paper, Scissors, Lizard or Spock"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Invalid choice!"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'BB8', 'C3PO'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  @@player_score = 0
  @@computer_score = 0

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors ++"
  end

  def display_goodbye_message
    puts "Thanks for playing! Good Bye!"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      return 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      return 0
    else
      "It's a tie!"
    end
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you wanna play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, enter y or n."
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def score
    # tracks display_winner method?
    if human.move > computer.move
      @@player_score += 1
    elsif human.move < computer.move
      @@computer_score += 1
    end
    puts "#{human.name}: #{@@player_score}"
    puts "#{computer.name}: #{@@computer_score}"
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      score # bonus function
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
