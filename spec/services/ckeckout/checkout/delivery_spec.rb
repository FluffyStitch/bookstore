# frozen_string_literal: true

RSpec.describe Checkout::Delivery do
  subject(:delivery) { described_class.new(order, order_params).call }

  let(:order) { create(:order, status: 1) }

  describe 'when delivery type is valid' do
    let(:order_params) { { delivery_type_id: delivery_type.id } }
    let(:delivery_type) { create(:delivery_type) }

    it { expect(delivery).to be true }

    it 'add delivery to order' do
      delivery
      expect(order.delivery_type).to eq delivery_type
    end
  end
end
