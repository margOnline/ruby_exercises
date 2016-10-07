#!/usr/bin/env ruby

require_relative './lib/checkout'
require_relative './lib/product'
require_relative './lib/minimum_spend_rule'
require_relative './lib/multi_buy_rule'

item1 = Product.new("001", "Lavender Heart", 9.25)
item2 = Product.new("002", "Personalised cufflinks", 45.00)
item3 = Product.new("003", "Kids T-shirt", 19.95)
min_spend_rule = MinimumSpendRule.new(60.00, 10)
multi_buy_rule = MultiBuyRule.new("001", 2, 8.50)
rules = [min_spend_rule, multi_buy_rule]

puts "\nTest data"
puts "---------"

co1 = Checkout.new(rules)
co1.scan(item1)
co1.scan(item2)
co1.scan(item3)
price = co1.total
puts "\nBasket: 001,002,003"
puts "Total price should = £66.78"
puts "Total price is #{price}"

co2 = Checkout.new(rules)
co2.scan(item1)
co2.scan(item3)
co2.scan(item1)
price = co2.total
puts "\nBasket: 001,003,001"
puts "Total price should = £36.95"
puts "Total price is #{price}"

co3 = Checkout.new(rules)
co3.scan(item1)
co3.scan(item2)
co3.scan(item3)
co3.scan(item1)
price = co3.total
puts "\nBasket: 001,002,003,001"
puts "Total price should = £73.76"
puts "Total price is #{price}\n\n"