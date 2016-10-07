require_relative 'price_adjuster'

class Checkout

  attr_accessor :promotional_rules, :basket

  def initialize(promotional_rules=[])
    @promotional_rules = promotional_rules
    @basket = []
  end

  def scan(item)
    basket << item
  end

  def total
    if promotional_rules.any? && applicable_rules.length > 0
      amount = PriceAdjuster.apply_promotions(basket, subtotal, applicable_rules)
      format(amount)
    else
      format(subtotal)
    end
  end

  private
  def subtotal
    basket.reduce(0){|sum, item| sum + item.price }
  end

  def applicable_rules
    promotional_rules.select{|rule| multi_buy?(rule) || minimum_spend?(rule) }
  end

  def minimum_spend?(rule)
    subtotal > rule.spend if rule.is_a?(MinimumSpendRule)
  end

  def multi_buy?(rule)
    return false unless rule.is_a?((MultiBuyRule))

    basket.select do |item| 
      item.code == rule.product_code
    end.length >= rule.minimum_quantity
  end

  def format(amount)
    '£%.2f' % amount
  end
 
end