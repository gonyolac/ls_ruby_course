require 'pry'
class OCR
  REFERENCE = {
    0 => " _\n| |\n|_|\n",
    1 => "\n  |\n  |\n",
    2 => " _\n _|\n|_\n",
    3 => " _\n _|\n _|\n",
    4 => "\n|_|\n  |\n",
    5 => " _\n|_\n _|\n",
    6 => " _\n|_\n|_|\n",
    7 => " _\n  |\n  |\n",
    8 => " _\n|_|\n|_|\n",
    9 => " _\n|_|\n _|\n"
  }.freeze

  def initialize(text)
    @text = text.split(/(?<=\n)\n/)
  end

  def convert
    @text.map {|x| lookup(x)}.join(',')
  end

  private

  def lookup(binary_font)
    base = binary_font.split("\n").map {|x| x.scan(/.{1,3}/)}.map {|x| x.empty? ? ["   "] : x}
    base.transpose.map {|x| REFERENCE.key(x.map{|y| y.rstrip << "\n" }.join) ? REFERENCE.key(x.map{|y| y.rstrip << "\n" }.join).to_s : "?" }.join
  end
end
