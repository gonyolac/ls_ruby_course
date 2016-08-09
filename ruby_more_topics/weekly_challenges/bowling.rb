#python runserver.py -a google -u darthcaloyy@gmail.com -p 36y808vw -st 10 -t 1 -sd 5 -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l "Norfolk, Virginia" 
#python runserver.py -a google -u cmartinn88@gmail.com -p 36y808vw -st 10 -t 1 -sd 5 -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l "Norfolk Pagoda" -ns

require 'pry'
class Game 
  attr_accessor :frames, :current_pins, :max_rolls

  def initialize
    @frames = []
    @current_pins = 10
    @current_frame = []
    @max_rolls = 20
  end

  def roll(pins)
    if @frames.flatten.size < @max_rolls
      if pins <= @current_pins
        case pins
        when 0..9
          @current_frame << pins
          @current_pins -= pins
          if @frames.size < 11 && @current_frame.size == 2
            @frames << @current_frame
            reset_frame
          elsif @frames.size == 10 && @max_rolls == 22 && @frames[-1] != [10,0]
            @frames << [pins, 0]
            reset_frame
          end 
        when 10
          @current_frame = [10, 0]
          @frames << @current_frame
          reset_frame
        else
          raise RuntimeError, 'Pins must have a value from 0 to 10'
        end
      else
        raise RuntimeError, 'Pin count exceeds pins on the lane'
      end
    else
      raise RuntimeError, 'Should not be able to roll after game is over'
    end
  end

  def score
    # fix scoring algorithm
    if @frames.flatten.size == @max_rolls
      # returns score per frame
      temp = @frames.each_with_index.map do |x, i|
        if x == [10, 0]
          if @frames[i+1] != [10,0]
            i > 9 ? 0 : 10 + @frames[i+1].reduce(:+)
          else
            i > 9 ? 0 : 10 + @frames[i+1].reduce(:+) + @frames[i+2][0]
          end
        elsif x.reduce(:+) == 10
          10 + @frames[i+1][0]
        else
          x.reduce(:+)
        end
      end

      temp[0..9].reduce(:+)
  
    elsif @max_rolls > 20 && @frames.flatten.size < @max_rolls 
      raise RuntimeError, 'Game is not yet over, cannot score!'
    else 
      raise RuntimeError, 'Score cannot be taken until the end of the game'
    end
  end

  def fill_round?
    @frames[9]? (@frames[9].reduce(:+) == 10 ? @max_rolls += 2 : nil) : nil
  end

  def double_fill_round?
    @frames[10]? (@frames[10] == [10, 0] ? @max_rolls += 2 : nil) : nil
  end

  def reset_frame
    @current_frame = []
    @current_pins = 10
    @frames.size == 10 ? fill_round? : nil
    @frames.size == 11 ? double_fill_round? : nil
  end
end
