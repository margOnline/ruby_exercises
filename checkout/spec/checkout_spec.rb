require 'checkout'
require 'product'
require 'price_adjuster'
require 'minimum_spend_rule'
require 'multi_buy_rule'

describe Checkout do

  subject { described_class.new(rules)}
  let(:item1) { Product.new("001", "Lavender Heart", 9.25) }
  let(:item2) { Product.new("002", "Personalised cufflinks", 45.00) }
  let(:item3) { Product.new("003", "Kids T-shirt", 19.95) }
  let(:min_spend_rule) { MinimumSpendRule.new(60.00, 10) }
  let(:multi_buy_rule) { MultiBuyRule.new("001", 2, 8.50) }
  let(:rules) { [min_spend_rule, multi_buy_rule] }

  describe "#scan" do
    it "adds an item to a basket" do
      expect{subject.scan(item1)}.to change { subject.basket.length }.by(1)
    end
  end

  describe "#total" do
    context "with no promotions" do
      let(:rules) { [] }

      it "sums the prices of the basket's items" do     
        subject.basket = [item1, item2, item3]
        expect(subject.total).to eq "£74.20"
      end
    end

    context "with minimum spend promotion" do
      it "calls the PriceAdjuster with the basket and minimum spend rule" do
        subject.basket = [item1, item2, item3]
        expect(PriceAdjuster).to receive(:apply_promotions)
          .with(subject.basket, 74.2, [min_spend_rule])
          .and_return(58.5)
        expect(subject.total).to eq "£58.50"
      end
    end

    context "with multi_buy promotion" do
      it "calls the PriceAdjuster with the basket and multi-buy rule" do
        subject.basket = [item1, item3, item1]
        expect(PriceAdjuster).to receive(:apply_promotions)
          .with(subject.basket, 38.45, [multi_buy_rule])
          .and_return(36.95)
        expect(subject.total).to eq "£36.95"
      end
    end

    context "with multi-buy and minimum spend promotions" do
      it "calls the PriceAdjuster with the basket and both promotional rules" do
        subject.basket = [item1, item2, item1, item3]
        expect(PriceAdjuster).to receive(:apply_promotions)
          .with(subject.basket, 83.45, rules)
          .and_return(73.76)
        expect(subject.total).to eq "£73.76"
      end
    end
  end

end