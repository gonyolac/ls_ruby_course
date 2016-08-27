class Poker
  CARD_VALUES = ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"]
  HAND_RANKING = ["SF","FOUR","FH","F","S","THREE","TWO","ONE","HIGH"]
  def initialize(hands)
    @hands = hands
  end

  def best_hand
    max_hand
    temp = @hands.select do |hand|
      classify_hand(hand)[:type] == max_hand[0]
    end
    temp.map {|hand| classify_hand(hand)[:type]}.size == 2 ? temp.select {|hand| classify_hand(hand)[:high] == max_hand[1]} : temp
  end

  private

  def classify_hand(hand)
    sorted = hand.sort_by {|x| CARD_VALUES.index(x[0])}

    hand_attrs = {}
    values = sorted.map{|card| card[0]}
    hand_attrs[:values] = values
    suits = sorted.map{|card| card[1]}.uniq
    hand_attrs[:suits] = suits
    cards = {}
    sorted.each {|x| cards[x[0]] = values.count(x[0])}
    hand_attrs[:cards] = cards

    if hand_attrs[:suits].size == 1 && consecutive?(hand_attrs[:values])
      hand_attrs[:type], hand_attrs[:high] = "SF", values[0]
    elsif hand_attrs[:cards].values.include?(4)
      hand_attrs[:type], hand_attrs[:high] = "FOUR", cards.key(cards.values.max)
    elsif hand_attrs[:cards].values.include?(3) && hand_attrs[:cards].values.include?(2)
      hand_attrs[:type], hand_attrs[:high] = "FH", cards.key(cards.values.max)
    elsif hand_attrs[:suits].size == 1 && !consecutive?(hand_attrs[:values])
      hand_attrs[:type], hand_attrs[:high] = "F", values[0]
    elsif hand_attrs[:suits].size > 1 && (consecutive?(hand_attrs[:values]) || hand_attrs[:values] == %w(A 5 4 3 2))
      hand_attrs[:type], hand_attrs[:high] = "S", values[0]
    elsif hand_attrs[:cards].values.include?(3) && hand_attrs[:cards].values.include?(1)
      hand_attrs[:type], hand_attrs[:high] = "THREE", cards.key(cards.values.max)
    elsif hand_attrs[:cards].values.count(2) == 2
      hand_attrs[:type], hand_attrs[:high] = "TWO", cards.key(cards.values.max) 
    elsif hand_attrs[:cards].values.count(2) == 1
      hand_attrs[:type], hand_attrs[:high] = "ONE", cards.key(cards.values.max)
    else
      hand_attrs[:type], hand_attrs[:high] = "HIGH", values.max
    end
    hand_attrs
  end

  def consecutive?(hand)
    CARD_VALUES.each_cons(5).to_a.include?(hand)
  end

  def max_hand
    temp2 = @hands.map {|hand| classify_hand(hand)}
    hash = {:types => [], :highs => []}
    temp2.each do |hand|
      hash[:types] << hand[:type]
      hash[:highs] << hand[:high]
    end
    hash[:types].sort_by! {|type| HAND_RANKING.index(type)}
    hash[:highs].sort_by! {|value| CARD_VALUES.index(value)}
    hash.map {|x| x[1][0]}
  end
end