# frozen_string_literal: true

RSpec.describe CartForm, type: :form do
  subject { described_class.new(Order.new) }

  describe 'when params is valid' do
    let(:coupon) { create(:coupon) }

    it { is_expected.to allow_value(coupon).for(:coupon) }
  end

  describe 'when params is invalid format' do
    let(:invalid_coupon) { create(:coupon, active: false) }

    it { is_expected.not_to allow_value(nil).for(:coupon) }
    it { is_expected.not_to allow_value(invalid_coupon).for(:coupon) }
  end

  describe 'when order has a coupon' do
    subject { described_class.new(Order.new(coupon: coupon)) }

    let(:coupon) { create(:coupon, active: false) }
    let(:new_coupon) { create(:coupon) }

    it { is_expected.not_to allow_value(new_coupon).for(:coupon) }
  end
end
