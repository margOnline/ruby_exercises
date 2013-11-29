class Word_composer

  attr_accessor :dictionary, :result

  def initialize
    @letter_dict = {}
    @result = []
    @n_dictionary = open_dictionary 6
    create_word_arrays
  end

  def solve
    parent_words = @n_dictionary.select{|word| get_sub_words_of(word)}
    @result
  end

  def get_sub_words_of word
    has_components? word
  end

  def open_dictionary number
    file = '/usr/share/dict/words'
    File.readlines(file).select { |line| n_letters?(number,line.chomp!) }
  end

  def create_word_arrays
    4.downto(2) {|n| @letter_dict[n] = find_n_letter_words n}
  end

  def has_components? word, index1, index2
    (@letter_dict[index1].include?(word[0,index1]) && 
    @letter_dict[index2].include?(word[-index2,index2]))
  end

  def components_for word, word_index
    @result << [word[0,word_index], word[-word_index,word_index], word]
  end

  def four_and_two_components word
    @result << [word[0,4], word[-2,2], word]
  end

  def two_three_components word
    @result << [word[0,3], word[-3,3], word]
  end

  def find_n_letter_words n
    @n_dictionary.select{|word| n_letters?(n, word)}
  end

  def n_letters?(n, word)
    word.size == n
  end

end

# compose = Word_composer.new()
# words = compose.solve
# words.each {|elem| puts "#{elem[0]} + #{elem[1]} = #{elem[2]}"}