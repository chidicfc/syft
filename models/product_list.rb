# frozen_string_literal: true

class ProductList
  DATA_FILE = 'data.csv'

  attr_reader :scanned_products
  attr_accessor :total

  def initialize(product_codes = [])
    @product_codes = product_codes
    @scanned_products ||= selected_products
    @total = @scanned_products.sum(&:price)
  end

  private

  def raw_data
    data = []
    file = File.join(__dir__, '..', DATA_FILE)

    IO.foreach(file).with_index do |line, index|
      next if index.zero?
      product_details = line.chomp.split(',')
      data << {
        product_code: product_details[0],
        name: product_details[1],
        price: product_details[2].to_f
      }
    end

    data
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
