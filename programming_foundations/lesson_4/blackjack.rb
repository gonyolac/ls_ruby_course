require 'pry'

SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
CARD_VALUES = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
MAGIC_NUMBER = 21

def prompt(msg)
  p "==> #{msg}"
end

def deal_card(plyr) # card deal method
  new_deal = CARD_VALUES.sample.to_s + " of " + SUITS.sample
  while @player_hand.index(new_deal) || @dealer_hand.index(new_deal)
    new_deal = CARD_VALUES.sample.to_s + " of " + SUITS.sample
  end

  if plyr == 'player'
    @player_hand << new_deal
  elsif plyr == 'dealer'
    @dealer_hand << new_deal
  end
end

def card_count(hnd)
  # iterate through each value of the array for count check
  # add card value into array for later sum
  count_arr = []
  hnd.each do |x|
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
  return count_arr.inject(:+)
end

def player_busted?
  if (card_count(@player_hand)).to_i > MAGIC_NUMBER
    return true
  end
end

def dealer_busted?
  if (card_count(@dealer_hand)).to_i > MAGIC_NUMBER
    return true
  end
end

def compare_hands
  if card_count(@player_hand) > card_count(@dealer_hand)
    prompt "Player wins!"
  elsif card_count(@player_hand) < card_count(@dealer_hand)
    prompt "Dealer wins!"
  else
    prompt "Tie!"
  end
end

loop do # 'play again' loop
  @player_hand = []
  @dealer_hand = []

  # initial card deal
  deal_card('player')
  deal_card('player')

  deal_card('dealer')
  deal_card('dealer')

  # initial hand display
  prompt "Player Hand: #{@player_hand.join(', ')}"

  prompt "Dealer Hand: #{@dealer_hand[0] + ', Face-Down Card'}"

  loop do # main game loop
    prompt "Player's Turn"
    loop do
      prompt "Player Hand: #{@player_hand.join(', ')}"
      prompt "Card count: #{card_count(@player_hand)}"
      break if player_busted?
      puts "Hit or stay?"
      answer = gets.chomp.to_s
      if answer.downcase.start_with?('s') || player_busted?
        break
      else
        deal_card('player')
      end
    end

    if player_busted?
      puts "Player BUSTS! Dealer WINS!"
      break
    else
      puts "Player stays!"
    end

    prompt "Dealer Turn"
    loop do
      break if dealer_busted?
      if card_count(@dealer_hand) < 17
        prompt "Dealer hits!"
        deal_card('dealer')
      elsif card_count(@dealer_hand) > 17
        break
      end
    end

    if dealer_busted?
      prompt "Dealer's Hand: #{@dealer_hand.join(', ')}"
      prompt "Player's Hand: #{@player_hand.join(', ')}"
      puts "Dealer BUSTS! Player WINS!"
      break
    else
      prompt "Dealer stays!"
      prompt "Dealer's Hand: #{@dealer_hand.join(', ')}"
      prompt "Player's Hand: #{@player_hand.join(', ')}"
      compare_hands
      break
    end
  end
  prompt "Play again? (yes or no)"
  play_answer = gets.chomp
  break unless play_answer.downcase.start_with?('y')
end

prompt "Thanks for playing Blackjack!"
