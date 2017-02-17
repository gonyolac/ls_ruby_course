require 'pry'

class ValueError < StandardError 
end

class Board
  def self.transform(input)
    self.valid_board?(input)
    final = input.map.with_index do |row, n|
      row.chars.map.with_index do |tile, i|
        tile == " " ? self.check_mines([n,i],input) : tile
      end.join
    end
    final
  end

  def self.check_mines(coords, input)
    x, y = coords[0], coords[1]
    mine_number = [input[x-1][y-1], input[x-1][y+1], input[x-1][y], input[x+1][y-1], input[x+1][y], input[x+1][y+1], input[x][y+1], input[x][y-1]].count('*')
    mine_number == 0 ? " " : mine_number
  end

  def self.valid_board?(arr)
    raise ValueError, "Invalid Character" if arr.join =~ /[^*-0123456789+| ]/
    raise ValueError, "Uneven Board Size" if arr.map {|x| x.size}.uniq.size > 1
    raise ValueError, "Faulty Horizontal Borders" if !(arr[0] =~ /\+-+\+/ && arr[-1] =~ /\+-+\+/)
    raise ValueError, "Faulty Vertical Borders" if arr[0..-2].all? {|x| x[0] == "|" && x[-1] == "|"}
  end
end

