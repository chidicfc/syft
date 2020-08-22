class OverSixtyRule
  DISCOUNT = 0.1
  AMOUNT = 60

  def self.apply(product_list)
    new(product_list).apply
  end

  def initialize(product_list)
    @product_list = product_list
  end

  def apply
    if condition
      @product_list.total *= (1 - DISCOUNT)
      @product_list.total = @product_list.total.round(2)
    end
    @product_list
  end

  private

  def condition
    @product_list.total > AMOUNT
  end
end
