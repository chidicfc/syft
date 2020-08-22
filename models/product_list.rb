class ProductList
  attr_reader :scanned_products
  attr_accessor :total

  def initialize(product_codes = [])
    @product_codes = product_codes
    @scanned_products ||= selected_products
    @total = @scanned_products.sum(&:price)
  end

  private

  def raw_data
    [
      { product_code: '001', name: 'Lavender heart', price: 9.25 },
      { product_code: '002', name: 'Personalised cufflinks', price: 45.00 },
      { product_code: '003', name: 'Kids T-shirt', price: 19.95 }
    ]
  end

  def product
    Struct.new(:code, :name, :price, keyword_init: true)
  end

  def products
    raw_data.map do |data|
      product.new(
        code: data[:product_code], name: data[:name], price: data[:price]
      )
    end
  end

  def find_by(product_code)
    products.find { |product| product.code == product_code }
  end

  def selected_products
    @product_codes.map { |code| find_by(code) }
  end
end
