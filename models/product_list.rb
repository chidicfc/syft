# frozen_string_literal: true

require File.join(__dir__, '..', 'services', 'products_file_service')

class ProductList
  attr_reader :scanned_products
  attr_accessor :total

  def initialize(product_codes = [], file_service: ProductsFileService)
    @product_codes = product_codes
    @file_service = file_service
    @scanned_products ||= selected_products
    @total = @scanned_products.sum(&:price)
  end

  private

  def raw_data
    @file_service.raw_data
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
