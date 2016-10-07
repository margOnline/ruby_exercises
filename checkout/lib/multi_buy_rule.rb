class MultiBuyRule
  
  attr_accessor :product_code, :minimum_quantity, :price

  def initialize(product_code, minimum_quantity, price)
    @product_code = product_code
    @minimum_quantity = minimum_quantity
    @price = price
  end

end
