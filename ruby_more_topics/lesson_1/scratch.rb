def hello
  "hello!"
end

hello
hello("hi") # ArgumentError 1 for 0
hello { puts 'hi' }

______________

def echo(str)
  str
end

echo # ArgumentError 0 for 1
echo("hello!") # returns hello
echo("hello", "world!") # ArgumentError 2 for 1

echo { puts "world" } # ArgumentError 0 for 1
echo("hello!") { puts "world" } # returns hello
echo("hello", "world!") { puts "world" } # ArgumentError 2 for 1

def echo_with_yield(str)
  yield # executes the implicit block
  str
end

echo_with_yield { puts "world" } # ArgumentError 0 for 1
echo_with_yield("hello!") { puts "world" } # returns world "hello!"
echo_with_yield("hello", "world!") { puts "world" } # ArgumentError 2 for 1 

echo_with_yield("hello!") # LocalJumpError: no block given (yield)

# refactor to allow conditional call of yield (only when a block is passed)
def echo_with_yield(str)
  yield if block_given?
  str
end

echo_with_yield("hello!") # returns hello
echo_with_yield("hello!") { puts "world" } # returns world "hello!"

______________

def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do # clears console then displays "> hi there"
  system 'clear'
end

______________

# when a block itself has an argument
3.times do |num|
  puts num
end

def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

increment(5) do |num|
  puts num
end

______________

def test
  yield(1, 2)
end

test { |num| puts num } # returns 1; extra block argument is ignored

def test
  yield(1)
end

test do |num1, num2|
  puts "#{num1} #{num2}" 
  # outputs '1 '; num2(nil) inside string interpolation turned into a space
end

# arity: rules enforcing the number of arguments that can be called on a closure

def compare(str)
  puts "Before: #{str}"
  after = yield(str) # yield call is stored in a local var
  puts "After: #{after}"
end

compare('hello') { |word| word.upcase }

# Before: hello
# After: HELLO

compare('hello') { |word| word.slice(1..2) }

# Before: hello
# After: el

compare('hello') { |word| "nothing to do with anything" }

# Before: hello
# After: nothing to do with anything

compare('hello') { |word| puts "hi" }

# Before: hello
# hi
# After: 

# block main use #1:
# blocks allow method flexibility without having to modify method implementation
# for method users
# INSIGHT GOLD: method implementor: "i don't know the specifics of your scenario, "
# "...so just pass it in when you need to call this method. I'll set it up so that"
# "...you can refine it later."

______________

# block main use #2:
# used in sandwich code -> methods that perform some "before" and "after" action

# example
def time_it
  time_before = Time.now
  yield # formerly 'does something'
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }
time_it { "hello world" }

# particularly useful for timing, logging, notification systems
# also important in resource management/interfacing with the operating system
# example
my_file = File.open("some_file.txt", "w+") # creates some_file.txt with read/write permission
# write something to the file with my_file.write
my_file.close

#alternate code (automatically closes file after writing something to it)
# mae possible through the block
File.open("some_file.txt", "w+") do |file|
  # write something to the file with my_file.write
end
______________

# explicit blocks

# &block converts the implicit block into a Proc object
# AKA: saves the block into a variable
# omitted on method implementation
def test(&block)
  puts "What's &block? #{block}"
end

test { sleep(1) }

# allows the block to be passed to another method 
# (now that it is represented by a variable)











