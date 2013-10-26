class Anagram

  attr_accessor :word

  def initialize word
    @word = word
  end

  def match(possible_anagrams)
    alphagram = make_alphagram_from(@word.downcase)
    anagrams = possible_anagrams.select{|word| !duplicate?(word) && (make_alphagram_from(word.downcase) == alphagram)}
  end

  def make_alphagram_from(word)
    word.chars.sort.join
  end

  def duplicate?(word)
    word.downcase == @word.downcase
  end

end
