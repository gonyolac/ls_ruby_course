# Queen Attack
require 'pry'
class Queens
  attr_reader :white, :black
  def initialize(white: [0,3], black: [7,3])
    raise ArgumentError, "Queens cannot occupy the same space" if white == black
    @board = Array.new(8, []).map {|x| Array.new(8, "_")}
    @white, @black = white, black
    place_queens
  end

  def to_s
    board_string = []
    @board.each {|row| board_string << row.join(' ')}
    board_string.join("\n")
  end

  def attack?
    # if they are on the same row; column and DIAGONAL
    @black[0] == @white[0] || @black[1] == @white[1] || ((@black[1] - @white[1]) / (@black[0] - @white[0])).abs == 1 ? true : false
  end

  private

  def place_queens
    @board[white[0]][white[1]] = "W"
    @board[black[0]][black[1]] = "B"
  end
end
