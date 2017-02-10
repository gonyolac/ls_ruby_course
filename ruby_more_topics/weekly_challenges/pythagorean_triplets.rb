require 'pry'
class Triplet
  def initialize(*nums)
    @numbers = nums.sort.flatten
  end

  def sum
    @numbers.reduce(:+)
  end

  def product
    @numbers.reduce(:*)
  end

  def pythagorean?
    @numbers[0] ** 2 + @numbers[1] ** 2 == @numbers[2] ** 2
  end

  def self.where(reqs)
    reqs[:min_factor] ||= 3
    triplet_sets = (reqs[:min_factor]..reqs[:max_factor]).to_a.combination(3).map {|arr| Triplet.new(arr)}      
    pyth_triplets = triplet_sets.select {|x| x.pythagorean?}
    reqs[:sum].nil? ? pyth_triplets : pyth_triplets.select {|x| x.sum == reqs[:sum]}
  end
end
