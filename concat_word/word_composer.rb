class Word_composer

  attr_accessor :dictionary

  def initialize
    words = open_dictionary
    create_word_arrays
  end

  def solve
    result = @six_letter_dict.select{|word| get_sub_words_of(word)}
  end

  def get_sub_words_of word
    return true if two_and_four_letters?(word) 
    return true if four_and_two_letters?(word) 
    return true if two_three_letters?(word)
    false
  end

  def open_dictionary
    dictionary = '/usr/share/dict/words'
    @dictionary = File.readlines(dictionary).each { |line|line.chomp! }
  end

  def create_word_arrays
    @six_letter_dict = find_n_letter_words 6
    @five_letter_dict = find_n_letter_words 5
    @four_letter_dict = find_n_letter_words 4
    @three_letter_dict = find_n_letter_words 3
    @two_letter_dict = find_n_letter_words 2
    @one_letter_dict = find_n_letter_words 1
  end

  def two_and_four_letters? word
    (@two_letter_dict.include?(word[0,2]) && 
    @four_letter_dict.include?(word[-4,4]))
  end

  def four_and_two_letters? word
    (@four_letter_dict.include?(word[0,4]) && 
    @two_letter_dict.include?(word[-2,2]))
  end

  def two_three_letters? word
    (@three_letter_dict.include?(word[0,3]) && 
    @three_letter_dict.include?(word[-3,3]))
  end

  def find_n_letter_words n
    @dictionary.select{|word| n_letters?(n, word)}
  end

  def is_word? word
    dictionary.include?(word)
  end

  def n_letters?(n, word)
    word.size == n
  end

end

compose = Word_composer.new()
result = compose.solve
puts result.inspect


