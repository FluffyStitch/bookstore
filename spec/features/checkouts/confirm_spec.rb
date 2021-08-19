# frozen_string_literal: true

RSpec.describe 'Checkout > Confirm', type: :feature, js: true do
  let(:current_page) { CheckoutConfirmPage.new }
  let(:user) { create(:user) }
  let(:order) { user.orders.create(attributes_for(:order)) }

  before do
    order.update(status: 3)
    order.update(delivery_type_id: create(:delivery_type).id)
    order.update(billing_address: create(:billing_address, addressable_id: order.id, addressable_type: order.class))
    order.update(shipping_address: create(:shipping_address, addressable_id: order.id, addressable_type: order.class))
    order.update(credit_card: create(:credit_card))
    sign_in user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'when edit billing address' do
    it 'redirect to addresses' do
      current_page.edits[0].click
      expect(current_page).to have_text I18n.t(:use_billing_address)
    end
  end

  describe 'when edit shipping address' do
    it 'redirect to addresses' do
      current_page.edits[1].click
      expect(current_page).to have_text I18n.t(:use_billing_address)
    end
  end

  describe 'when edit delivery' do
    it 'redirect to delivery' do
      current_page.edits[2].click
      expect(current_page).to have_text I18n.t(:delivery_type)
    end
  end

  describe 'when edit payment' do
    it 'redirect to payment' do
      current_page.edits[3].click
      expect(current_page).to have_text I18n.t(:credit_card)
    end
  end

  describe 'when confirm' do
    it 'redirect to complete' do
      current_page.save.click
      expect(current_page).to have_text I18n.t(:thx_for_order)
    end
  end
end
