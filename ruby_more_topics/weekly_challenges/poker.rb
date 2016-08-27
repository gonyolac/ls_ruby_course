class Poker
  CARD_VALUES = ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"]
  HAND_RANKING = ["SF","FOUR","FH","F","S","THREE","TWO","ONE","HIGH"]

  def initialize(hands)
    @hands = hands
  end

  def best_hand
    maxes
    winning_hand = @hands.select {|hand| classify_hand(hand)[:type] == maxes[0]}
    winning_hand.map {|hand| classify_hand(hand)[:type]}.size == 2 ? winning_hand.select {|hand| classify_hand(hand)[:high] == maxes[1]} : winning_hand
  end

  private

  def classify_hand(hand)
    sorted = hand.sort_by {|x| CARD_VALUES.index(x[0])}

    hand_attrs = {}
    hand_attrs[:values] = sorted.map{|card| card[0]}
    hand_attrs[:suits] = sorted.map{|card| card[1]}.uniq
    card_counts = {}
    sorted.each {|x| card_counts[x[0]] = hand_attrs[:values].count(x[0])}
    hand_attrs[:card_counts] = card_counts

    if hand_attrs[:suits].size == 1 && consecutive?(hand_attrs[:values])
      hand_attrs[:type], hand_attrs[:high] = "SF", hand_attrs[:values][0]
    elsif hand_attrs[:card_counts].values.include?(4)
      hand_attrs[:type], hand_attrs[:high] = "FOUR", card_counts.key(card_counts.values.max)
    elsif hand_attrs[:card_counts].values.include?(3) && hand_attrs[:card_counts].values.include?(2)
      hand_attrs[:type], hand_attrs[:high] = "FH", card_counts.key(card_counts.values.max)
    elsif hand_attrs[:suits].size == 1 && !consecutive?(hand_attrs[:values])
      hand_attrs[:type], hand_attrs[:high] = "F", hand_attrs[:values][0]
    elsif hand_attrs[:suits].size > 1 && (consecutive?(hand_attrs[:values]) || hand_attrs[:values] == %w(A 5 4 3 2))
      hand_attrs[:type], hand_attrs[:high] = "S", hand_attrs[:values][0]
    elsif hand_attrs[:card_counts].values.include?(3) && hand_attrs[:card_counts].values.include?(1)
      hand_attrs[:type], hand_attrs[:high] = "THREE", card_counts.key(card_counts.values.max)
    elsif hand_attrs[:card_counts].values.count(2) == 2
      hand_attrs[:type], hand_attrs[:high] = "TWO", card_counts.key(card_counts.values.max) 
    elsif hand_attrs[:card_counts].values.count(2) == 1
      hand_attrs[:type], hand_attrs[:high] = "ONE", card_counts.key(card_counts.values.max)
    else
      hand_attrs[:type], hand_attrs[:high] = "HIGH", hand_attrs[:values].max
    end
    hand_attrs
  end

  def consecutive?(hand)
    CARD_VALUES.each_cons(5).to_a.include?(hand)
  end

  def maxes
    classified_hands = @hands.map {|hand| classify_hand(hand)}
    hash = {:types => [], :highs => []}
    classified_hands.each do |hand|
      hash[:types] << hand[:type]
      hash[:highs] << hand[:high]
    end
    hash[:types].sort_by! {|type| HAND_RANKING.index(type)}
    hash[:highs].sort_by! {|value| CARD_VALUES.index(value)}
    hash.map {|x| x[1][0]}
  end
end

=begin
#notes
#types of ranking: by hand type AND by internal hand high relevant cards

#CARD_VALUES.each_cons(5).to_a.include?(hand) for consecutive identification
  straight flush: suits.size == 1 && consecutive, HIGH
  four of a kind: cards.values.include?(4), HIGH
  full house: cards.values.include?(3) && cards.values.include?(2), HIGH 
  flush: suits.size == 1 && !consecutive, compare by hand
  straight: suits.size > 1 && consecutive, compare by hand
  three of a kind: cards.values.include?(3) && cards.values.include?(1), HIGH
  two pair: cards.values.count(2) == 2, compare by hand
  one pair: cards.values.count(2) == 1, compare by hand
  high card: ELSE, HIGH
=end
