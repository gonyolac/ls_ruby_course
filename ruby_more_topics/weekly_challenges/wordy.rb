#python runserver.py -a ptc -u cmartin0001 -u cmartin0003 -u cmartin0004 -u cmartin0005 -u cmartin0006 -u cmartin0007 -u cmartin0008 -p 36y808vw -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l '-6.207099, 106.810187' -st 10 -sd 8
require 'pry'

class WordProblem
  OPERATIONS = ['plus', 'minus', 'multiplied', 'divided'].freeze
  def initialize(question)
    @problem = question.split
    @current_total = 0
  end

  def answer
    raise ArgumentError, "Question is invalid" if OPERATIONS.none? {|x| parse.include?(x)}

    @current_total += parse[0]

    (1..(parse.size-1)).each do |x|
      if OPERATIONS.include?(parse[x])
        next
      elsif parse[x].integer?
        send "#{parse[x-1]}", parse[x]
      end
    end
    @current_total
  end

  def parse
    @problem.map {|x| x.to_i == 0 ? (OPERATIONS.include?(x) ? x : nil) : x.to_i}.compact
  end

  private 

  def plus(i)
    @current_total += i
  end

  def minus(i)
    @current_total -= i
  end

  def multiplied(i)
    @current_total *= i
  end

  def divided(i)
    @current_total /= i
  end
end

