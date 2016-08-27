class Robot

  @@existing_names = []
  attr_accessor :name
  def initialize
    @name = generate_name
    @@existing_names << @name
  end

  def reset
    initialize
  end

  private

  def generate_name
    name = ''
    loop do 
      name = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + (000..999).to_a.sample.to_s
      break unless @@existing_names.include?(name)
    end
    name
  end
end