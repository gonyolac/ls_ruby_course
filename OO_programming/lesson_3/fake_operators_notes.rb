class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)

puts "bob is older than kim" if bob > kim

__________________________________________

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    return if person.not_yet_18?
    members.push person
  end

  def +(other_team) 
  # modify methods drawing from their standard library functions (in this case incrementing)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members 
    # added code makes dream_team return as a new Team object
    # original code: 'members + other_team.members'
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

cowboys = Team.new("Dallas Cowboys")
cowboys.members << Person.new("Emmitt Smith", 46)
cowboys.members << Person.new("Troy Aikman" , 48)
cowboys.members << Person.new("Michael Irvin", 49)

niners = Team.new("San Francisco 49ers")
niners.members << Person.new("Joe Montana", 59)
niners.members << Person.new("Jerry Rice", 52)
niners.members << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners
dream_team.name = "Dream Team"

dream_team[4]
dream_team[5] = Person.new("Odell Beckham Jr.", 13)

puts dream_team.inspect

__________________________________________

# Array element reference
test_array[1] 
test_array.[](1)

# Array element assignment 
test_array[1] = "two"
test_array.[]=(1, "two")









