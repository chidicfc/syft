# frozen_string_literal: true

class Rule
  def self.apply(product_list)
    new(product_list).apply
  end

  def initialize(product_list)
    @product_list = product_list
  end
  private_class_method :new
end
