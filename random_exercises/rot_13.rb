
BASE = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
LETTERS = %w(n o p q r s t u v w x y z a b c d e f g h i j k l m)

def rot13(string)
  # only letters are shifted
  array = string.chars
  array.map {|x| x =~ /[a-z]/i ? (x =~ /[A-Z]/ ? x = LETTERS[BASE.index(x.downcase)].upcase : x = LETTERS[BASE.index(x)]) : x}.inject(:+)
end

p rot13("test") #=> grfg
p rot13("Test")

#alt solution
=begin
  def rot13(string)
    string.tr("A-Za-z","N-ZA-Mn-za-m")
  end
=end