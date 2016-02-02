[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

# => ["1", "2", "3", "4", "5"]

# shortcut for above
# allows method chaining
# doesn't work for methods that take arguments
[1, 2, 3, 4, 5].map(&:to_s).map(&:to_i)

# works for any collection method that takes a block
# examples
["hello", "world"].each(&:upcase!)
[1, 2, 3, 4, 5].select(&:odd?)
[1, 2, 3, 4, 5].select(&:odd?).any?(&:even?)

# (&:to_s) = { |n| n.to_s }
# Ruby will turn object after & into a proc, calling Symbol#to_proc on it

# another example
def my_method
  yield(2)
end

# happens under the hood/automatically upon shortcut call
a_proc = :to_s.to_proc

my_method(&:to_s)
# => "2"




