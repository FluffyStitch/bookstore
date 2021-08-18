# frozen_string_literal: true

RSpec.describe Order::TransferCart do
  subject(:transfer_cart) { described_class.new(user, session).call }

  let(:user) { create(:user) }
  let(:session) { { cart_id: cart } }
  let(:cart) { create(:order) }

  describe 'when transfer cart' do
    before { transfer_cart }

    it { expect(user.current_order).to eq cart }
    it { expect(session[:cart_id]).to be nil }
  end
end
