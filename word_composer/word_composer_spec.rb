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

  it 'shows a six letter word with its 2 and 4 letter component words' do
    expect(word_composer.two_and_four_components('ordeal')).to eq [['or', 'deal', 'ordeal']]
  end

  it 'shows a six letter word with its 4 and 2 letter component words' do
    expect(word_composer.four_and_two_components('tailor')).to eq [['tail', 'or', 'tailor']]
  end

  it 'shows a six letter word with its 2 3 letter component words' do
    expect(word_composer.two_three_components('convex')).to eq [['con', 'vex', 'convex']]
  end
  
end