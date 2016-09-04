class BeerSong
  def verse(line)
    verse_classes = [ZeroBottles, OneBottle, TwoBottles][line] || StandardVerse 
    verse_classes.new.verse(line)
  end

  def verses(start, ending)
    start.downto(ending).map {|x| verse(x)}.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end
end

#bonus: replace conditionals with polymorphism refactoring

class StandardVerse
  def verse(line)
    "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" +
     "Take one down and pass it around, #{line-1} bottles of beer on the wall.\n"
  end
end

class ZeroBottles
  def verse(line=nil)
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n" 
  end
end

class OneBottle
  def verse(line=nil)
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class TwoBottles
  def verse(line=nil)
    "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end
