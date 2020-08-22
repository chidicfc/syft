RSpec.describe LavenderHeartRule do
  subject { described_class.apply(product_list) }

  context '.apply' do
    let(:product_list) { ProductList.new(product_codes) }

    context 'when there is one lavender heart' do
      let(:product_codes) { %w[001 002] }

      it 'calculates the cost' do
        expect(subject.total).to eq(54.25)
      end
    end

    context 'when there are two lavender hearts' do
      let(:product_codes) { %w[001 001 002] }

      it 'applies a discount' do
        expect(subject.total).to eq(62.0)
      end
    end
  end
end
