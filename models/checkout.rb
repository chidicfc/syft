Dir[File.join(__dir__, '..', 'rules', '*.rb')].each { |file| require file }

require File.join(__dir__, 'currency')
require File.join(__dir__, 'product_list')

class Checkout
  attr_reader :rules, :product_codes

  def initialize(rules = [])
    @rules = rules
    @product_codes = []
  end

  def scan(product_code)
    product_codes.push(product_code)
  end

  def total
    print_total
  end

  private

  def product_list
    ProductList.new(product_codes)
  end

  def amount
    rules.inject(product_list) { |list, rule| rule.apply(list) }.total
  end

  def print_total
    Money.from_amount(amount, 'GBP').format
  end
end
