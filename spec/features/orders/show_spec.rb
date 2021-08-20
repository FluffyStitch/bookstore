# frozen_string_literal: true

RSpec.describe 'Orders > Show', type: :feature, js: true do
  let(:current_page) { MyOrder.new }
  let(:order) { create(:order, status: 4) }
  let!(:order_item) { create(:order_item, order: order) }

  before { current_page.load(id: order.id) }

  it { expect(current_page).to have_content order_item.book.title }
end
