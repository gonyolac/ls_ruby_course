def check_DNA(seq1, seq2)
  s1_match = matching_sequence(seq1)
  s2_match = matching_sequence(seq2)

  seq2.reverse.include?(s1_match) || seq1.include?(s2_match.reverse)
end

def matching_sequence(sequence)
  temp = sequence.chars.map do |x|
    if x == 'A'
      x = 'T'
    elsif x == 'T'
      x = 'A'
    elsif x == 'C'
      x = 'G'
    elsif x == 'G'
      x = 'C'
    end
  end
  temp.inject(:+)
end

p matching_sequence('AGTCTGTATGCATCGTACCC')

p check_DNA('AGTCTGTATGCATCGTACCC','GGGTACGATGCATACAGACT')