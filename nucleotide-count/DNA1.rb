class DNA

  attr_reader :string
  attr_accessor :nucleotides 

  def initialize string
    @string = string
    @nucleotides = {"A" => 0, "T" => 0, "C" => 0, "G" => 0}
  end

  def dna?(char)
    raise ArgumentError.new ("#{char} is not a valid nucleotide") if !@nucleotides.key?(char)
  end

  def count(nucleotide)
    nucleotide_counts
    @nucleotides.key?(nucleotide) ? @nucleotides[nucleotide] : 0
  end

  def nucleotide_counts
    chars = @string.chars
    chars.each do |char|
      if @nucleotides.key?(char)
        @nucleotides[char] += 1
      end
    end
    @nucleotides
  end

end
