require 'pry'

def format_(text, width)
  final_array = []
  test = text.split(' ')
  line = ''
  counter = 0
  loop do
    line << test[counter] + ' '
    counter += 1

    if test[counter] == nil
      final_array << line.strip!
      break
    end

    if line.size + test[counter].size > width
      line.strip!
      final_array << line
      line = ''
    end
  end
  final_array.join("\n")
end


test = "Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Aliquam nec consectetur risus. Cras vel urna
a tellus dapibus consequat. Duis bibendum
tincidunt viverra. Phasellus dictum efficitur sem
quis porttitor. Mauris luctus auctor diam id
ultrices. Praesent laoreet in enim ut placerat.
Praesent a facilisis turpis."

format_(test, 50)