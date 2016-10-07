require 'price_adjuster'
require 'product'
require 'minimum_spend_rule'
require 'multi_buy_rule'

describe PriceAdjuster do

  subject { described_class.new(basket, total, rules)}
  let(:item1) { Product.new("001", "Lavender Heart", 9.25) }
  let(:item2) { Product.new("002", "Personalised cufflinks", 45.00) }
  let(:item3) { Product.new("003", "Kids T-shirt", 19.95) }
  let(:min_spend_rule) { MinimumSpendRule.new(60.00, 10) }
  let(:multi_buy_rule) { MultiBuyRule.new("001", 2, 8.50) }

  describe "#apply_promotions" do

    context "with minimum spend promotion" do
      it "reduces the basket subtotal by the minimum spend discount" do
        rules = [min_spend_rule]
        basket = [item1, item2, item3]
        subject = described_class.new(basket, 65, rules)
        expect(subject.apply_promotions).to eq 58.50
      end
    end

    context "with multi-buy promotion" do
      it "reduces the total by the multi-buy price adjustment" do
        rules = [multi_buy_rule]
        basket = [item1, item3, item1]
        subject = described_class.new(basket, 38.45, rules)
        expect(subject.apply_promotions).to eq 36.95
      end
    end

    context "with multi-buy and minimum spend promotions" do
      it "applies the multi-buy rule first, then the minimum spend rule" do
        rules = [min_spend_rule, multi_buy_rule]
        basket = [item1, item2, item1, item3]
        subject = described_class.new(basket, 83.45, rules)
        expect(subject.apply_promotions).to eq 73.76
      end
    end
  end

end