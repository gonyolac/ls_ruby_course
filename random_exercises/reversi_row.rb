require 'pry'
def reversi_row(moves)
  @board = '.' * 8
  @moves = moves
  @moves.each do |x|
    @moves.index(x).even? ? @board[x] = '*' : @board[x] ='O'
    @board.gsub!(/(\*O+\*)/,'*' * @board.match(/(\*O+\*)/).to_s.size)  
    @board.gsub!(/(O\*+O)/,'O' * @board.match(/(O\*+O)/).to_s.size)
  end
  @board
end

# moves -> array (0 to 7 corresponding to 8 squares aka index)
#black "*" plays first ; white "O"
# moves array may be empty but always valid input
# result -> string representing board state