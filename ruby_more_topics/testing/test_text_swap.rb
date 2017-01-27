require 'minitest/autorun'
require_relative 'text_swap'

class TextTest < Minitest::Test
  def setup
    @text = Text.new("The quick brown fox")
  end

  def test_swap
    assert_equal @text.swap('a','e'), "Tha quick brown fox" 
  end

  def test_word_count
    assert_equal @text.word_count, 4
  end
end