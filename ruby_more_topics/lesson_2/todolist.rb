class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description ='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# notes and personal annotations
=begin
puts todo1
# => [ ] Go to the gym
todo1.done!
puts todo1
# => [X] Go to the gym
puts "--end of todo class test--"
=end
#___________________________________

# Reminder: you can create instance objects within the same class;
# public methods are accessible anywhere within the class it is under
# (i.e. inside other public methods etc.) 

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? {|todo| todo.done?}
  end

  def <<(todo)
    raise TypeError, 'Can only add Todo objects' unless todo.class == Todo
    @todos << todo
  end
  alias_method :add, :<<

  def item_at(list_num)
    @todos.fetch(list_num)
  end

  def mark_done_at(list_num)
    item_at(list_num).done!
  end

  def mark_undone_at(list_num)
    item_at(list_num).undone!
  end

  def done!
    @todos.each_index do |list_num|
      mark_done_at(list_num)
    end
  end

  def remove_at(list_num)
    item_at(list_num)
    @todos.slice!(list_num)
    # @todos.delete(item_at(list_num)) 
  end

  def to_s
    # \n how to setup as a return value
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
    #@todos.map do |x|
    #  input = x.to_s + "\n"
    #  text << input
    #end
  end

  def to_a
    @todos
  end

  def each
    counter = 0
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    #@todos.each do |todo|
    #  yield(todo)
    end
    self
  end

  def select
    new_list = TodoList.new(title)
    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  def find_by_title(title)
    @todos.each do |todo|
      if todo.title == title
        puts todo
      end
    end
    nil
    # select { |todo| todo.title == title}.first
  end

  def all_done
    @todos.select { |todo| todo.done? }
  end

  def all_not_done
    @todos.select { |todo| !todo.done? }
  end

  def mark_done(title)
    @todos.each do |todo|
      if todo.title == title
        todo.done!
      end
    end
  end

  def mark_done_at(list_num)
    item_at(list_num).done!
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  #def index_test(num)
  #  @todos.fetch(num)
  #end
end

=begin

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to the gym")
list = TodoList.new("Today's Todos")

list << todo2
list << todo3
list << todo1

list.each do |todo|
  puts todo
end
=end

#---end of each test---
=begin
alternative code 

#method implementation
add attr_reader :todos

# method invocation
list.todos.each do |todo|
  do something here
end

Q: Why not allow users to iterate through exposing @todos array?
A: Encapsulation; we'd rather hide implementation details from users and
encourage them to use the public methods / interfaces that we created
*Users can potentially modify internal states that were implemented and
not meant to be modified (i.e. certain exceptions per container etc.);
Ripple effect throughout the code is avoided with these measures
=end 

=begin
#__________________________
#---start of select test---
todo1.done!

results = list.select { |todo| todo.done? }

puts results.inspect

#---end of select test---
# from ruby standard library, methods should generally return an object
# of the calling class 
=end











