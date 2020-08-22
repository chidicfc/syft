class LavenderHeartRule
  PRODUCT_CODE = '001'
  PRICE = 8.5
  NUMBER = 2

  def self.apply(product_list)
    new(product_list).apply
  end

  def initialize(product_list)
    @product_list = product_list
  end

  def apply
    if condition
      @product_list.total -= discount
    end
    @product_list
  end

  private

  def scanned_products
    @product_list.scanned_products
  end

  def eligible_products
    @eligible_products ||= scanned_products.select { |product| product.code == PRODUCT_CODE }
  end

  def number_of_eligible_products
    eligible_products.size
  end

  def condition
    number_of_eligible_products >= NUMBER
  end

  def eligible_product
    eligible_products.first
  end

  def discount
    number_of_eligible_products * (eligible_product.price - PRICE)
  end
end
