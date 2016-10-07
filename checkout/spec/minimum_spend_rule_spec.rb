require 'minimum_spend_rule'

describe MinimumSpendRule do
  let(:subject) { described_class.new(spend, percentage) }
  let(:spend) { 60.00 }
  let(:percentage) { 10 }

  describe "#initialize" do
    it "takes 2 parameters" do
      expect(subject).to be_a MinimumSpendRule
      expect(subject.spend).to eq 60.00
      expect(subject.percentage).to eq 10
    end

    it "throws an error with incorrect number of parameters" do
      expect{described_class.new(spend)}.to raise_exception ArgumentError
    end
  end
end