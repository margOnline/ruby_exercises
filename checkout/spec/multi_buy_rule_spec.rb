require 'multi_buy_rule'

describe MultiBuyRule do
  let(:subject) { described_class.new(product_code, minimum_quantity, price) }
  let(:product_code) { 60.00 }
  let(:minimum_quantity) { 2 }
  let(:price) { 9.25 }

  describe "#initialize" do
    it "takes 3 parameters" do
      expect(subject).to be_a MultiBuyRule
      expect(subject.product_code).to eq 60.00
      expect(subject.minimum_quantity).to eq 2
      expect(subject.price).to eq 9.25
    end

    it "throws an error with incorrect number of parameters" do
      expect{described_class.new(product_code)}.to raise_exception ArgumentError
    end
  end
end