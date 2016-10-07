class PriceAdjuster

  def self.apply_promotions(basket, total, rules)
    new(basket, total, rules).apply_promotions
  end

  def initialize(basket, total, rules)
    @basket = basket
    @total = total
    @rules = rules
  end

  def apply_promotions
    multi_buy_rules, min_spend_rules = rules.partition do |rule| 
      rule.is_a?(MultiBuyRule)
    end
    adjusted_sum = multi_buy_rules.reduce(total) { |total, rule| apply_multi_buy(rule, total) }
    min_spend_rules.reduce(adjusted_sum) { |sum, rule| apply_minimum_spend(rule, sum) }
  end

  private
  attr_accessor :basket, :total, :rules

  def apply_minimum_spend(rule, sum)
    (sum - (sum * rule.percentage/100.to_f)).round(2)
  end

  def apply_multi_buy(rule, sum)
    applicable_products = basket.select{ |item| item.code == rule.product_code }
    product_discount = applicable_products.first.price - rule.price
    sum -= product_discount * applicable_products.length
  end

end