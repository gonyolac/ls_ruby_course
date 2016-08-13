class Diamond
  ALPHABET = ('A'..'Z').to_a
  def self.make_diamond(letter)
    @length, diamond = 2 * (ALPHABET.index(letter)) + 1, []

    1.upto(ALPHABET.index(letter)) do |idx|
      diamond << " " * ((@length/2) - idx) + ALPHABET[idx] + " " * (2 * (idx - 1) + 1) + ALPHABET[idx] + " " * ((@length/2) - idx) + "\n"
    end

    diamond.unshift(" " * ALPHABET.index(letter) + "A" + " " * ALPHABET.index(letter) + "\n")
    diamond << diamond[0..-2].reverse
    diamond.flatten.join('')
  end
end