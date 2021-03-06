# frozen_string_literal: true

RSpec.describe Checkout do
  subject(:checkout) { described_class.new(promotional_rules) }

  let(:promotional_rules) { [LavenderHeartRule, OverSixtyRule] }

  context 'when the basket contains products: 001, 002, 003' do
    it 'calculates the total' do
      checkout.scan('001')
      checkout.scan('002')
      checkout.scan('003')

      expect(checkout.total).to eq('£66.78')
    end
  end

  context 'when the basket contains products: 001, 003, 001' do
    it 'calculates the total' do
      checkout.scan('001')
      checkout.scan('003')
      checkout.scan('001')

      expect(checkout.total).to eq('£36.95')
    end
  end

  context 'when the basket contains products: 001, 002, 001, 003' do
    it 'calculates the total' do
      checkout.scan('001')
      checkout.scan('002')
      checkout.scan('001')
      checkout.scan('003')

      expect(checkout.total).to eq('£73.76')
    end
  end

  context 'when the total is called twice between scans' do
    it 'applies the rules and returns the total' do
      checkout.scan('001')
      checkout.scan('001')
      checkout.scan('003')

      expect(checkout.total).to eq('£36.95')

      checkout.scan('001')
      checkout.scan('002')

      expect(checkout.total).to eq('£81.41')
    end
  end

  context 'when the total is called twice' do
    it 'returns the same total twice' do
      checkout.scan('001')
      checkout.scan('001')
      checkout.scan('003')

      expect(checkout.total).to eq('£36.95')
      expect(checkout.total).to eq('£36.95')
    end
  end

  context 'when the total is called immediately after initialisation' do
    it 'returns 0' do
      expect(checkout.total).to eq('£0.00')
    end
  end
end
