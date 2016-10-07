class MinimumSpendRule
  
  attr_accessor :spend, :percentage

  def initialize(spend, percentage)
    @spend = spend
    @percentage = percentage
  end

end