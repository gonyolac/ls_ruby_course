# initial solution
=begin
def autocorrect(input)
  flagged = %w(you u)

  new_message = input.split(' ').map do |x| 
    if flagged.include?(x.downcase) || (x[0..3] == 'youu')
      x.gsub(x,'your sister')
    elsif (x[0..2] == 'you' && x[x.size-1] =~ /[\W]/)
      x.gsub(x[0..(x.size-2)], 'your sister')
    else  
      x
    end
  end
  new_message.join(' ')
end
=end

def autocorrect(input)
  input.gsub(/\b(you+|u)\b/, 'your sister')
end

# all instances of 'u' or 'you'  

p autocorrect("Can't wait to see uuuu")