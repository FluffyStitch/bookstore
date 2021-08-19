# frozen_string_literal: true

RSpec.describe 'Checkout > Complete', type: :feature, js: true do
  let(:current_page) { CheckoutCompletePage.new }
  let(:user) { create(:user) }
  let(:order) { user.orders.create(attributes_for(:order)) }

  before do
    order.update(status: 4)
    order.update(billing_address: create(:billing_address, addressable_id: order.id, addressable_type: order.class))
    sign_in user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'when back to store' do
    it 'redirect to catalog' do
      current_page.store.click
      expect(current_page.current_url).to include '/books'
    end
  end
end
