test_wishlist = [
    {:name => "mini puzzle", :size => "small", :clatters => "yes", :weight => "light"},
    {:name => "toy car", :size => "medium", :clatters => "a bit", :weight => "medium"},
    {:name => "card game", :size => "small", :clatters => "no", :weight => "light"}
]

test_presents = [
    {:size => "medium", :clatters => "a bit", :weight => "medium"},
    {:size => "small", :clatters => "yes", :weight => "light"}
]

require 'pry'

def guess_gifts(wishlist, presents) 
# should return an array that matches criteria in presents hash
  guessed = []
  presents.each do |x|
    wishlist.each do |y|
      (y.values_at(:size, :clatters, :weight) == x.values_at(:size, :clatters, :weight) ? guessed << y[:name] : false)
    end
  end
  guessed.uniq
end

p guess_gifts(test_wishlist, test_presents)
