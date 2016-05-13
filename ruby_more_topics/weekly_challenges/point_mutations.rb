class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(reference)
    distance_count = 0
    counter = 0
    until counter == @strand.size || counter == reference.size do
      @strand[counter] != reference[counter] ? distance_count += 1 : nil
      counter += 1
    end
    distance_count
  end
end