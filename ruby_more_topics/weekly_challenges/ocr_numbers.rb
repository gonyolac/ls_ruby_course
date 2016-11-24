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
  }
  def initialize(text)
    @text = text
  end

  def convert
    @text.include?("\n\n") ? @text = @text.gsub("\n\n","\n\nx").split("\nx") : @text
    @text.class == Array ? @text.map {|x| cipher(x)}.join(',') : cipher(@text)
  end

  private

  def cipher(binary)
    base = binary.split("\n").map {|x| x.scan(/.{1,3}/)}
    base.transpose.map {|x| REFERENCE.key(x.map{|y| y.rstrip << "\n" }.join) ? REFERENCE.key(x.map{|y| y.rstrip << "\n" }.join).to_s : "?" }.join
  end
end


