class Deck
  attr_reader :deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end
end

class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    @rank.to_s + " of " + @suit
  end

  def value
    VALUES.fetch(@rank, @rank)
  end

  def suit_rank
    SUITS.fetch(@suit, @suit)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class PokerHand
  def initialize(deck)
    @hand = deck
    5.times {@hand << deck.draw}
  end

  def print
    @hand.each {|card| card.to_s}
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def values
    @hand.map {|x| x.value}
  end

  def suits
    @hand.map {|x| x.suit}
  end

  def royal_flush?
    values.inject(:+) == 60 && suit.uniq.size == 1
  end

  def straight_flush?
    values.min + 4 == values.max && @hand.map {|x| x.suit}.uniq.size == 1
  end

  def four_of_a_kind?
    !values.select {|x| values.count(x) == 4}.empty? 
  end

  def full_house?
    !values.select {|x| values.count(x) == 3}.empty? && values.select {|x| values.count(x) == 2}.empty?
  end

  def flush?
    suits.uniq.size == 1
  end

  def straight?
    values.include?((values.min..values.max).to_a)
  end

  def three_of_a_kind?
    !values.select {|x| values.count(x) == 3}.empty? && values.select {|x| values.count(x) == 2}.empty?
  end

  def two_pair?
    values.select {|x| values.count(x) == 2}.size == 4
  end

  def pair?
    values.select {|x| values.count(x) == 2}.size == 2
  end
end

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
p hand.evaluate