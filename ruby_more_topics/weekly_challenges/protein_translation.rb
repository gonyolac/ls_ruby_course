class Translation
  # no need for initialize?; no indication of instance object; class method
  #track states of a Translation? (no need!)
  @codon_codes = {
    "Methionine": ['AUG'],
    "Phenylalanine": ['UUU', 'UUC'],
    "Leucine": ['UUA', 'UUG'],
    "Serine": ['UCU', 'UCC', 'UCA', 'UCG'],
    "Tyrosine": ['UAU', 'UAC'],
    "Cysteine": ['UGU', 'UGC'],
    "Tryptophan": ['UGG'],
    "STOP": ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(codon)
    filtered_codes = @codon_codes.select {|k,v| v.include?(codon)}

    raise InvalidCodonError if filtered_codes.empty?

    valid_protein = (filtered_codes.keys[0]).to_s
  end

  # Translation.of_codon('AUG') DONE 
  # => 'Methionine' DONE
  # essentially, display the protein (key) where the inputted codon is present; DONE
  # scan the values in the hash then display corresponding key with the match DONE
  
  # need to find out: how to use key method to find occurence/match within the array

  def self.of_rna(rna_strand)
    # display array with protein values, translated from rna_strand
    proteins = [] # final display array
    codons = [] # works!

    rna_index = 0
    while rna_index < rna_strand.size
      codons << rna_strand.slice(rna_index..rna_index+2)
      rna_index += 3
    end

    codons.each do |codon|
      string_codon = codon.to_s
      break if self.of_codon(string_codon) == "STOP"
      proteins << self.of_codon(string_codon)
    end

    # code prior to refactor
    #protein_counter = 0
    #while protein_counter < codons.size
    #  need_to_translate = codons[protein_counter].to_s
    #  break if self.of_codon(need_to_translate) == "STOP"
    #  proteins << self.of_codon(need_to_translate)
    #  protein_counter += 1
    #end

    proteins
  end
end

class InvalidCodonError < Exception
end
