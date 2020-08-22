# frozen_string_literal: true

RSpec.describe OverSixtyRule do
  subject { described_class.apply(product_list) }

  context '.apply' do
    let(:product_list) { ProductList.new(product_codes) }

    context 'when the total is lesss than 60' do
      let(:product_codes) { %w[001 001 003] }

      it 'calculates the cost' do
        expect(subject.total).to eq(38.45)
      end
    end

    context 'when the total is more than 60' do
      let(:product_codes) { %w[001 002 003] }

      it 'applies a discount' do
        expect(subject.total).to eq(66.78)
      end
    end
  end
end
