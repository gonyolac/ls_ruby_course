class Person
  attr_accessor :first_name, :last_name 

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{self.first_name} #{self.last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    @first_name = parts.size > 1 ? parts[0] : parts
    @last_name = parts.size > 1 ? parts[1] : ''
  end

  def to_s
    name
  end

end

bob = Person.new("Robert")
rob = Person.new("Robert")
puts bob.first_name
puts bob.last_name
bob.name = "Robert Lewandowskurrr"
puts bob.name

puts "His name is #{bob}"

