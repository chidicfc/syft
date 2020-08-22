class Rule
  def self.apply(product_list)
    new(product_list).apply
  end

  def initialize(product_list)
    @product_list = product_list
  end
end
