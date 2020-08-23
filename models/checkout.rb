# frozen_string_literal: true

Dir[File.join(__dir__, '..', 'rules', '*.rb')].sort.each { |file| require file }

require File.join(__dir__, 'currency')
require File.join(__dir__, 'product_list')

class Checkout
  def initialize(rules = [])
    @rules = rules
    @product_codes = []
  end

  def scan(product_code)
    @has_new_item = true
    product_codes.push(product_code)
  end

  def total
    total = total_price
    @has_new_item = false
    print_total(total)
  end

  private

  attr_reader :rules, :product_codes

  def product_list
    @product_list = ProductList.new(product_codes)
  end

  def apply_rules
    rules.inject(product_list) { |list, rule| rule.apply(list) }.total
  end

  def total_price
    if defined?(@product_list) && !@has_new_item
      @product_list.total
    else
      apply_rules
    end
  end

  def print_total(total)
    Money.from_amount(total, 'GBP').format
  end
end
