def encrypt(text, n)
  return text if text == '' || n <= 0
  @text = text.chars
  counter = 0 
  until counter == n
    seconds = @text.select.with_index {|x, i | (i+1).even?}
    firsts = @text.select.with_index {|x, i | (i+1).odd?}
    @text = (seconds + firsts).join.chars
    counter += 1
  end
  @text.join('')
end

def decrypt(encrypted_text, n)
  return encrypted_text if encrypted_text == '' || n <= 0
  @text = encrypted_text
  counter = 0
  until counter == n
    seconds = @text.chars[0..(@text.size/2)-1]
    firsts = @text.chars[(@text.size/2)..-1]
    @text = test.zip(temp).flatten.join
    counter += 1
  end
  @text
end

# every even character shoudld be taken and concat
# output: string of even characters THEN the rest of the remainder characters
# DONE : captured the firsts and seconds characters
# DONE : incorporate loop function to the method
