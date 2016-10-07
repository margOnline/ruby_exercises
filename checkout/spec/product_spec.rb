require 'product'

describe Product do
  let(:subject) { described_class.new(code, name, price) }
  let(:code) { "001" }
  let(:name) { "foo" }
  let(:price) { 10.00 }

  describe "#initialize" do
    it "takes 3 parameters" do
      expect(subject).to be_a Product
      expect(subject.code).to eq "001"
      expect(subject.name).to eq "foo"
      expect(subject.price).to eq 10.00
    end

    it "throws an error with incorrect number of parameters" do
      expect{described_class.new(code,name)}.to raise_exception ArgumentError
    end
  end
end