def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new { puts "hi #{name}"}
name = "Griffin III" # name reassignment after Proc invocation

call_me(chunk_of_code)
# supposedly invalid because of scoping rules
# 'name' local variable shouldn't have been accessible inside the method

# initial output: w/o *modification

# hi Robert
# => nil

# latest output:

# hi Griffin III
# => nil

=begin
binding: elements track its surrounding context and drags it (in invocation?);
closures must keep track of its surrounding context in order to have the information
it needs to be executed later
=end

