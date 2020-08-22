# frozen_string_literal: true

RSpec.describe ProductList do
  subject(:product_list) { ProductList.new(product_codes) }

  let(:product_codes) { %w[001 002 003] }

  it 'stores the scanned products' do
    expect(product_list.scanned_products).to match_array(
      [
        have_attributes(code: '001', name: 'Lavender heart', price: 9.25),
        have_attributes(code: '002', name: 'Personalised cufflinks', price: 45.00),
        have_attributes(code: '003', name: 'Kids T-shirt', price: 19.95)
      ]
    )
  end

  it 'stores the total' do
    expect(product_list.total).to eq(74.2)
  end
end
