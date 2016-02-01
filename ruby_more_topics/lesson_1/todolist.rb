class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :DONE_MARKER

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    @done = true
  end

  def done?
    @done
  end

  def undone!
    @done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end


todo1 = Todo.new("Go to the gym")
puts todo1
# => [ ] Go to the gym
todo1.done!
puts todo1
# => [X] Go to the gym
puts "--end of todo class test--"
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

  def add(item)
    raise TypeError, 'Can only add Todo objects' unless item.class == Todo
    @todos.push(item)
  end
  alias_method :<<, :add

  def size
    @todos.length
  end

  def first
    @todos[0]
  end

  def last
    @todos[@todos.length - 1]
  end

  def item_at(list_num)
    index_test(list_num)
    @todos[list_num]
  end

  def mark_done_at(list_num)
    index_test(list_num)
    @todos[list_num].done!
  end

  def mark_undone_at(list_num)
    index_test(list_num)
    @todos[list_num].undone! 
  end

  def shift
    @todos.slice!(0)
  end

  def pop
    @todos.slice!(@todos.length - 1)
  end

  def remove_at(list_num)
    index_test(list_num)
    @todos.slice!(list_num) 
  end

  def to_s
    # how to setup as a return value
    text = "---- #{@title} ----\n"
    @todos.map do |x|
      input = x.to_s + "\n"
      text << input
    end
    text
  end

  def each
    counter = 0
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end
    @todos
  end

  def select
    counter = 0
    new_list = TodoList.new(title)
    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  # done
  def find_by_title(title)
    @todos.each do |todo|
      if todo.title == title
        puts todo
      end
    end
    nil
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

  def mark_all_done
    @todos.each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    @todos.each do |todo|
      todo.undone!
    end
  end

  private

  def index_test(num)
    @todos.fetch(num)
  end
end

todo2 = Todo.new("Clean room")
todo3 = Todo.new("Buy milk")
list = TodoList.new("Today's Todos")

list << todo2
list << todo3
list << todo1

list.each do |todo|
  puts todo
end

puts '---end of each test--'
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

todo1.done!

results = list.select { |todo| todo.done? }

puts results.inspect

puts '---end of select test--'
# from ruby standard library, methods should generally return an object
# of the calling class 










