require_relative 'concat_word'

describe 'Concat-word' do

  let(:concat_word){Concat_word.new('be', 'foul')}

  it 'requires 2 parameters' do
    expect(concat_word).to be_true
  end

  it 'joins 2 words' do
    expect(concat_word.join_words).to eq 'befoul'
  end

  it 'looks up words in a dictionary' do
    word = 'zygot'
    expect(Concat_word.new('tailor','or').open).to be_false
  end

  it 'knows if a word is in the dictionary' do
    expect(concat_word.is_word?).to be_true
  end

  it 'knows if a word is not in the dictionary' do
    expect(Concat_word.new('tailor','or').is_word?).to be_false
  end


  
end