require_relative 'injacere'
describe Array do

  let(:array) {[1,2,3,4]}

  it 'accepts a default value' do
    expect(array.injacere(5) {|memo, elem| memo + elem}).to eq 15
  end

  context 'injacere method returns' do 

    it 'the sum of passing all array elems through an addition block' do
      expect(array.injacere {|memo, elem| memo + elem}).to eq 10
    end

    it 'the product of passing all array elems through a muliplication block' do
      expect(array.injacere {|memo, elem| memo * elem}).to eq 24
    end

    it 'returns the shortest word from an array' do
      expect(['a', 'be', 'cat'].injacere do |memo, elem|
        memo.length < elem.length ? memo : elem
      end).to eq 'a'
    end
  
    it 'nil if array is empty' do
      array = Array.new
      expect(array.injacere).to eq nil
    end

  end
end

