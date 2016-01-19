# Classes: BlackjackTable Player Dealer Game
# Modules: Deck
require 'pry'

module Deck
  SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
end

class BlackjackTable
  MAGIC_NUMBER = 21
  include Deck

  attr_accessor :hand, :current_card_count

  def initialize
    @@aggregate_card_list = []
    @hand = []
    @current_card_count = 0
  end

  def hit
    random_card = FACES.sample + " of " + SUITS.sample
    while @@aggregate_card_list.index(random_card)
      random_card
    end

    @hand << random_card
    @@aggregate_card_list << random_card
  end

  def card_count
    count_arr = []
    @hand.each do |x|
      if x.start_with?('K', 'Q', 'J', '10')
        count_arr << 10
      elsif x[0] == 'A'
        current_sum = count_arr.inject(:+)
        if (current_sum).to_i < 11
          count_arr << 11
        else
          count_arr << 1
        end
      else
        count_arr << x[0].to_i
      end
    end
    @current_card_count = count_arr.inject(:+)
    return count_arr.inject(:+)
  end

  def bust?
    # include a card count method with condition
    if @current_card_count.to_i > MAGIC_NUMBER
      return true
    end
  end

  def self.reset_agg_card_list
    @@aggregate_card_list.clear
  end

end

class Player < BlackjackTable
end

class Dealer < BlackjackTable
end

class Game
  BOT_NAMES = ["R2D2", "C3PO", "BB8"]
  attr_reader :player, :dealer

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @player_name = ''
    @computer_name = ''
  end

  def start
    set_names
    loop do
      loop do
        welcome_message
        reset
        initial_deal
        show_initial_cards
        player_turn
        player_bust_check
        break if @player.bust?
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
    puts "============================="
    puts "============================="
    puts "====Welcome to Blackjack!===="
    puts "============================="
    puts "============================="
  end

  def set_names
    set_player_name
    set_computer_name
  end

  def set_player_name
    loop do
      puts "Input your name: "
      @player_name = gets.chomp
      break if @player_name.size > 0
      puts "Input a valid name"
    end
  end

  def set_computer_name
    @computer_name = BOT_NAMES.sample
  end

  def reset
    puts "<=#{@computer_name} shuffles the deck=>"
    @player.hand.clear
    @dealer.hand.clear
    BlackjackTable.reset_agg_card_list
  end

  def initial_deal
    @dealer.hit
    @player.hit
    @dealer.hit
    @player.hit
  end

  def show_initial_cards
    puts "Your current hand: #{@player.hand}" 
    puts "Dealer's hand: [#{@dealer.hand[0]}, Face-Down Card]"
  end

  def player_turn
    puts "=======#{@player_name}'s Turn======="
    loop do
      puts "Your current hand: #{@player.hand}" 
      puts "Card Count: #{player.card_count}"
      break if @player.bust?
      puts "Hit or Stay?"
      answer = gets.chomp.to_s
      if answer.downcase.start_with?('s') || @player.bust?
        break
      else
        @player.hit
      end
    end
  end

  def dealer_turn
    puts "=======Dealer's Turn!======="
    loop do
      break if @dealer.bust?
      if @dealer.card_count < 17
        @dealer.hit
        puts "<=Dealer hits!=>"
      elsif @dealer.card_count > 17
        break
      end
    end
    dealer_bust_check
  end

  def dealer_bust_check
    if @dealer.bust? == true
    puts "=======Dealer busts!======="
    puts "Dealer's Hand: #{@dealer.hand}"
    puts "Card Count: #{@dealer.card_count}"
    end
  end

  def player_bust_check
    if @player.bust? == true
      puts "#{@player_name} busts!"
    end
  end

  def show_result
    puts "#{@player_name}'s Hand: #{@player.hand}"
    puts "#{@computer_name}'s Hand: #{@dealer.hand}"
    if @player.card_count > @dealer.card_count
      display_card_counts
      puts "+++++#{@player_name} wins!+++++"
    elsif @dealer.card_count > @player.card_count
      display_card_counts
      puts "+++++#{@computer_name} wins!+++++"
    else
      display_card_counts
      puts "It's a tie!"
    end
  end

  def display_card_counts
    puts "#{@player_name}'s hand count: #{player.card_count}"
    puts "#{@computer_name}'s hand count: #{dealer.card_count}"
  end

  def exit_message
    puts "Thanks for playing #{@player_name}! Till next time!"
  end
end

Game.new.start

