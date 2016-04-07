require 'pry'
def title_case(title, minor_words = '')
  if title == ''
    ''
  else
    title_words = title.split(' ')
    non_capped = minor_words.split(' ').map {|x| x.downcase}
    # iterate over title_words; check the first character of each array element
    # if it matches with any of the minor_words array UNLESS first word of the title
    before_join = title_words.map do |x|
      if x == title_words[0] # if x is first element of title_words
        x.capitalize
      else # x is not the first element/word
        !non_capped.include?(x.downcase) ? x.capitalize : x.downcase
      end
    end
    before_join.join(' ')
  end
end

p title_case("the QUICK bRoWn fOX", "xyz fox quick the")
