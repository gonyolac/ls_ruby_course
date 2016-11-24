def duplicate_count(text)
  #text.downcase.chars.uniq.map{|x| text.downcase.count(x)}.count {|x| x > 1}
  ('a'..'z').count {|x| text.downcase.count(x) > 1}
end

p duplicate_count("abcdeaB")