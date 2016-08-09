def permutations(array)
  final_perms = []
  possibilities = array.size.downto(1).inject(:*)
  until final_perms.size == possibilities
    final_perms << array.sample(array.size) if !final_perms.include?(array.sample)
  end
  final_perms
end

p permutations([1,2,3,4])