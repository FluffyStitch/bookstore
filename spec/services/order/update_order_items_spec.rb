# frozen_string_literal: true

RSpec.describe Order::UpdateOrderItems do
  subject(:order) { described_class.new(params).call }

  let(:cart) { create(:order) }
  let(:params) { { cart: cart, params: order_params } }

  describe 'when add new order item' do
    let(:order_params) { attributes_for(:order_item) }

    it 'success' do
      expect { order }.to change { cart.order_items.count }.by(1)
    end
  end

  describe 'when change quantity' do
    let!(:order_item) { cart.order_items.create(item_order_params) }
    let(:item_order_params) { attributes_for(:order_item) }
    let(:order_params) { attributes_for(:order_item, book_id: order_item.book.id) }

    it 'not change order items count' do
      expect { order }.to change { cart.order_items.count }.by(0)
    end
  end
end
