# frozen_string_literal: true

RSpec.describe OrderForm, type: :form do
  subject { described_class.new(order) }

  let(:order) { create(:order) }

  describe 'when params is null' do
    it { is_expected.to validate_presence_of(:billing_address) }
    it { is_expected.to validate_presence_of(:shipping_address) }
  end

  describe 'when address is valid' do
    let(:billing_address) { create(:billing_address, addressable_id: order.id, addressable_type: order.class) }
    let(:shipping_address) { create(:shipping_address, addressable_id: order.id, addressable_type: order.class) }

    it { is_expected.to allow_value(billing_address).for(:billing_address) }
    it { is_expected.to allow_value(shipping_address).for(:shipping_address) }
  end
end
