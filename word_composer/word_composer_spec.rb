require_relative 'word_composer'

describe 'Word_composer' do

  let(:word_composer){Word_composer.new()}

  it 'knows if a word has six letters' do
    word = 'rubies'
    expect(word_composer.n_letters?(6, word)).to be_true
  end

  it 'knows if a word has five letters' do
    word = 'pearl'
    expect(word_composer.n_letters?(5, word)).to be_true
  end

  it 'knows if a word has four letters' do
    word = 'ruby'
    expect(word_composer.n_letters?(4, word)).to be_true
  end

  it 'knows if a word has three letters' do
    word = 'gem'
    expect(word_composer.n_letters?(3, word)).to be_true
  end

  it 'knows if a word has two letters' do
    word = 'is'
    expect(word_composer.n_letters?(2, word)).to be_true
  end

  it 'knows if a word has one letter' do
    word = 'a'
    expect(word_composer.n_letters?(1, word)).to be_true
  end

  it 'knows if word is composed of 2 words 4 and 2 letters long' do
    expect(word_composer.four_and_two_letters?('tailor')).to be_true
  end

  it 'knows if word is composed of 2 words 2 and 4 letters long' do
    expect(word_composer.two_and_four_letters?('ordeal')).to be_true
  end

  it 'knows if word is composed of 2 words each 3 letters long' do
    expect(word_composer.two_three_letters?('convex')).to be_true
  end

  it 'knows if a word is in the dictionary' do
    expect(word_composer.is_word?('tail')).to be_true
  end

  it 'knows if a word is not in the dictionary' do
    expect(word_composer.is_word?('ilor')).to be_false
  end
  
end