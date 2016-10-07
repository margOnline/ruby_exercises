class Product
  
  attr_accessor :name, :code, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

end