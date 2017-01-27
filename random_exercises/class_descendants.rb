class Mother
  def self.phone_kids
    classes = ObjectSpace.each_object(::Class).select {|klass| klass < self }
    classes.each {|x| x.phone}
  end
end

class Foo < Mother
end

class Bar < Mother
end

class Fuck < Foo
end

p Mother.phone_kids