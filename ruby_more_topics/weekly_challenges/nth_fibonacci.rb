class Fibonacci
  def self.nth(position)
    @sequence = [0, 1]
    next_fibonacci until @sequence[position]
    @sequence[position]
  end

  def self.next_fibonacci
    tail_number = @sequence[-1]
    second_to_last = @sequence[-2]
    pushed_number = tail_number + second_to_last
    @sequence << pushed_number
  end
end
