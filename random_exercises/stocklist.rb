# A..Z -> 3 or more capital letters code
# 1st letter = capital letter of book category
# positive integer n after letter coded -> quantity of book in stock

# stocklist has the same length and numbers (i.e. 5 letters 2 numbers length stocklist)

# given a stocklist (input) and list of categories in capital letters 
# category_list_example -> M = ["A", "B", "C", "D"]

# Determine: common length of codes and common length of quantities
require 'pry'

b = ["ABAR 200", "ASSD 400", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600", "ZASK 1000"]
c = ["Y", "V", "W"]

#OUTPUT = "(A : 200) - (B : 1140)"

def stockList(booklist, catlist)
  output_string = []
  base = booklist.select {|x| catlist.include?(x[0])}

  catlist.each do |category|
    stock_count = base.select {|code| category == code[0]}.map {|code| code.gsub(/\D/,'').to_i}.reduce(:+)
    stock_count = 0 if stock_count.nil?
    output_string << "(#{category} : #{stock_count})"
  end
  return '' if output_string.all? {|x| x.include?(": 0")}
  output_string.join(" - ")
end

p stockList(b, c)