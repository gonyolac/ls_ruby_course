require 'pry'
class Event

  def initialize
    @handlers = []
  end

  def subscribe(function)
    @handlers.push(function)
  end

  def unsubscribe(function)
    @handlers.delete(function)
  end

  def emit(*args)
    @handlers.each {|function| function.call(*args)}
  end
end

class Testf
  attr_accessor :calls, :args

  def initialize
    @calls = 0
    @args = []
  end

  def call(*args)
    @calls += 1
    @args += args
  end
end

f = Testf.new
event = Event.new
event.subscribe(f)
event.emit(1, 'foo', true)
p f.calls
p f.args
event.unsubscribe(f)
event.emit(2)
p f.calls




