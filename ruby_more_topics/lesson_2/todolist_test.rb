require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to the gym")
    @todos = [@todo1, @todo2, @todo3] # array used to test against

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # TESTS GO HERE
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_raise_typerror_with_add
    assert_raises(TypeError) { @list.add(2) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_add_alias
    test_todo = Todo.new("Test todo")
    @list << test_todo # << used on list class object
    todos = @todos << test_todo # << used directly on @todos array

    assert_equal(todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(4) }
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    @list.mark_done_at(2)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(4) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @todo1.done!
    @todo2.done!
    @todo3.done!

    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(4) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    # HEREDOC allows us to set a block of text as an assertion
    # chomp and gsub methods exclude preceeding and trailing newlines
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to the gym
    OUTPUT


    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to the gym
    OUTPUT


    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to the gym
    OUTPUT


    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each_1s
    @list.each { |todo| todo.done! }
    assert_equal(true, @list.done?)
  end

  def test_each_2
    assert_equal(@list, @list.each {|todo| nil })
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(true, @list.select { |todo| todo.done? }.done?)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end
end

