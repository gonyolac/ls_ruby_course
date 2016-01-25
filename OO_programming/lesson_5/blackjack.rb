# Classes: Card Player Human Dealer Game
# Modules: Deck

class Card
  SUITS = %w(Hearts Diamonds Spades Clubs)
  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize
    @face = ''
    @suit = ''
  end

  def random_face
    @face = FACES.sample
  end

  def random_suit
    @suit = SUITS.sample
  end

  def to_s
    @face + @suit
  end
end

class Player
  
  BUST_VALUE = 21

  attr_accessor :hand, :current_card_count, :name

  def initialize
    @hand = []
    @@aggregate_card_list = []
    @current_card_count = 0
    @name = ''
    @new_card = Card.new
  end

  def hit
    local_card = ''
    loop do
      @new_card.random_face
      @new_card.random_suit 
      local_card = @new_card.to_s
      break unless @@aggregate_card_list.index(local_card)
    end

    @hand << local_card
    @@aggregate_card_list << local_card
  end

  def card_count
    count_arr = []
    @hand.each do |x|
      if x.start_with?('K', 'Q', 'J', '10')
        count_arr << 10
      elsif x.start_with?('2', '3', '4', '5', '6', '7', '8', '9')
        count_arr << x[0].to_i
      elsif x[0] == 'A'
        current_sum = count_arr.inject(:+)
        if (current_sum).to_i < 11
          count_arr << 11
        else
          count_arr << 1
        end
      end
    end
    count_arr.inject(:+)
  end

  def set_current_card_count
    @current_card_count = card_count
  end

  def bust?
    @current_card_count.to_i > BUST_VALUE
  end

  def reset
    @hand = []
  end
end

class Human < Player
  def set_name
    loop do
      puts 'Input your name: '
      @name = gets.chomp
      break if @name.size > 0
      puts 'Input a valid name'
    end
  end
end

class Dealer < Player
  BOT_NAMES = %w(R2D2 C3PO BB8)

  def set_bot_name
    @name = BOT_NAMES.sample
  end
end

class Game
  attr_reader :human, :dealer

  def initialize
    @human = Human.new
    @dealer = Dealer.new
  end

  def start
    set_players_names
    loop do
      loop do
        reset_deck
        initial_deal
        human_turn
        human_bust_check
        break if @human.bust?
        dealer_turn
        break if @dealer.bust?
        show_result
        break
      end
      puts "Play again? (y/n)"
      play_answer = gets.chomp
      break unless play_answer.downcase.start_with?('y')
    end
    exit_message
    #binding.pry
  end

  private

  def welcome_message
    puts "Welcome to Blackjack"
  end

  def play_again?
    puts 'Play again? (y/n)'
    play_answer = gets.chomp

    if play_answer.downcase.start_with?('y')
      return true
    end
  end

  def set_players_names
    @human.set_name
    @dealer.set_bot_name  
  end

  def reset_deck
    @human.reset
    @dealer.reset
  end

  def initial_deal
    @dealer.hit
    @human.hit
    @dealer.hit
    @human.hit
  end

  def show_initial_cards
    puts "Your current hand: #{@human.hand}"
    puts "Dealer's hand: [#{@dealer.hand[0]}, Face-Down Card]"
  end

  def human_turn
    clear
    welcome_message
    show_initial_cards
    puts "=======#{@human.name}'s Turn======="
    loop do
      puts "Your current hand: #{@human.hand}"
      puts "Card Count: #{human.card_count}"
      @human.set_current_card_count
      break if @human.bust?
      puts 'Hit or Stay?'
      answer = gets.chomp.to_s
      if answer.downcase.start_with?('s') || @human.bust?
        break
      else
        @human.hit
      end
    end
  end

  def dealer_turn
    clear
    puts "=======Dealer's Turn!======="
    loop do
      @dealer.set_current_card_count
      break if @dealer.bust?
      if @dealer.card_count < 17
        @dealer.hit
        puts '<=Dealer hits!=>'
      elsif @dealer.card_count > 17
        break
      elsif @dealer.card_count == 17
        break
      end
    end
    dealer_bust_check
  end

  def dealer_bust_check
    if @dealer.bust?
      puts "=======#{@dealer.name} busts!======="
      puts "#{@dealer.name}'s Hand: #{@dealer.hand}"
      puts "Card Count: #{@dealer.card_count}"
    end
  end

  def human_bust_check
    if @human.bust?
      puts "#{@human.name} busts!"
    end
  end

  def show_result
    puts "#{@human.name}'s Hand: #{@human.hand}"
    puts "#{@dealer.name}'s Hand: #{@dealer.hand}"
    if @human.card_count > @dealer.card_count
      display_card_counts
      puts "+++++#{@human.name} wins!+++++"
    elsif @dealer.card_count > @human.card_count
      display_card_counts
      puts "+++++#{@dealer.name} wins!+++++"
    else
      display_card_counts
      puts "It's a tie!"
    end
  end

  def display_card_counts
    puts "#{@human.name}'s hand count: #{human.card_count}"
    puts "#{@dealer.name}'s hand count: #{dealer.card_count}"
  end

  def exit_message
    puts "Thanks for playing #{@human.name}! Till next time!"
  end

  def clear
    system 'clear'
  end
end

Game.new.start
