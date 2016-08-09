class Garden
  SEED_GUIDE = {"V" => :violets, "R" => :radishes, "C" => :clover, "G" => :grass}
  def initialize(diagram, students = ["alice", "bob", "charlie", "david", "eve", "fred", "ginny", "harriet", "ileana", "joseph", "kincaid", "larry"])
    diagram = diagram.split("\n")
    @row1 = diagram[0].split('').each_slice(2).to_a.map {|x| sub_seed(x)}
    @row2 = diagram[1].split('').each_slice(2).to_a.map {|x| sub_seed(x)}
    @students = students.map{|x| x.downcase}.sort
    setup_student_methods
  end

  def designate_plants
    Hash[@students.zip(@row1.zip(@row2))]
  end

  def setup_student_methods
    designate_plants.each {|student, plants| define_singleton_method(student) {plants.nil? ? nil : plants.flatten}}
  end

  def sub_seed(array)
    array.map {|x| SEED_GUIDE[x]} 
  end
end