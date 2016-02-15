require 'pry'

class CircularBuffer
  class BufferEmptyException < IOError; end
  class BufferFullException < IOError; end

  attr_accessor :write_index

  def initialize(buffer_size)
    @buffer = []
    @write_index = 0
    @size = buffer_size
  end

  def write(data)
    raise BufferFullException if buffer_full?
    if !data.nil?
      @buffer[@write_index] = data
    end
    @buffer.compact!
    update_write_index
  end

  def write!(data)
    if buffer_full?
      if data != nil
        @buffer[@write_index] = data
        self.read
      end
    elsif !buffer_full?
      write(data)  
    end
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.compact!
    @buffer.shift
  end

  def clear
    @buffer.clear
    @write_index = 0
  end

  def buffer_full?
    @size == @buffer.size
  end

  def update_write_index
    @write_index += 1
  end
end

