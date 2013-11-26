class Concat_word

  attr_accessor :word1, :word2

  def initialize(word1,word2)
    @word1 = word1
    @word2 = word2
  end

  def join_words
    "#{@word1}#{@word2}"
  end

  def open_dictionary
    dictionary = '/usr/share/dict/words'
    File.readlines(dictionary)
  end

  def is_word?
    joined = "#{join_words}\n"
    dictionary = open_dictionary
    dictionary.include?(joined)
  end

end

concat_word = Concat_word.new('zygo', 'style')
puts concat_word.is_word?