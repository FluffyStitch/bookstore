# frozen_string_literal: true

RSpec.describe Payment do
  subject(:payment) { described_class.new(order, order_params).call }

  let(:order) { create(:order, status: 2) }

  describe 'when delivery type is valid' do
    let(:order_params) { { credit_card: credit_card } }
    let(:credit_card) { attributes_for(:credit_card) }

    it { expect(payment).to be true }

    it 'add credit card to order' do
      payment
      expect(order.credit_card).not_to be nil
    end
  end
end
