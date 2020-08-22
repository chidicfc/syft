require File.join(__dir__, 'rule')

class OverSixtyRule < Rule
  DISCOUNT = 0.1
  AMOUNT = 60

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
