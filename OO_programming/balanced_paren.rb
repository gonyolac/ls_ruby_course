def balancer(string)
  filtered = string.gsub(/[^()]/,'').split('')
  @paren_eval = []
  if filtered[0] == ')' || filtered.empty?
    return false
  else
    filtered.each_with_index do |x, index|
      if x == '('
        filtered[index + 1] == ')' ? @paren_eval << true : @paren_eval << false
      elsif x == ')'
        filtered[index - 1] == '(' ? @paren_eval << true : @paren_eval << false
      end  
    end
    @paren_eval.include?(false) ? false : true
  end
end


test_string = '()()()()()('

p balancer(test_string)