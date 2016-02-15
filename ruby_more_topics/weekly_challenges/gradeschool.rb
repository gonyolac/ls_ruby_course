class School
  def initialize
    @roster = {}
  end

  def to_h
    result = {}
    @roster.keys.sort.each do |key|
      result[key] = @roster[key].sort
    end
    result
  end

  def add(name, num)
    @roster[num] = grade(num) << name
  end

  def grade(num)
    return [] unless @roster[num]
    @roster[num]
  end
end
