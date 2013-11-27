class Word_composer

  attr_accessor :dictionary, :result

  def initialize
    @letter_dict = {}
    @result = []
    @dictionary = open_dictionary
    create_word_arrays
  end

  def solve
    @letter_dict[6].select{|word| get_sub_words_of(word)}
    @result
  end

  def get_sub_words_of word
    return two_and_four_components(word) if two_and_four_letters?(word) 
    return four_and_two_components(word) if four_and_two_letters?(word) 
    return two_three_components(word) if two_three_letters?(word)
    false
  end

  def open_dictionary
    file = '/usr/share/dict/words'
    File.readlines(file).each { |line|line.chomp! }
  end

  def create_word_arrays
    @letter_dict[6] = find_n_letter_words 6
    4.downto(2) {|n| @letter_dict[n] = find_n_letter_words n}
  end

  def two_and_four_letters? word
    (@letter_dict[2].include?(word[0,2]) && 
    @letter_dict[4].include?(word[-4,4]))
  end

  def two_and_four_components word
    @result << [word[0,2], word[-4,4], word]
  end

  def four_and_two_letters? word
    (@letter_dict[4].include?(word[0,4]) && 
    @letter_dict[2].include?(word[-2,2]))
  end

  def four_and_two_components word
    @result << [word[0,4], word[-2,2], word]
  end

  def two_three_letters? word
    (@letter_dict[3].include?(word[0,3]) && 
    @letter_dict[3].include?(word[-3,3]))
  end

  def two_three_components word
    @result << [word[0,3], word[-3,3], word]
  end

  def find_n_letter_words n
    @dictionary.select{|word| n_letters?(n, word)}
  end

  def n_letters?(n, word)
    word.size == n
  end

end

# compose = Word_composer.new()
# words = compose.solve
# words.each {|elem| puts "#{elem[0]} + #{elem[1]} = #{elem[2]}"}