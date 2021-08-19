# frozen_string_literal: true

RSpec.describe 'Checkout > Delivery', type: :feature, js: true do
  let(:current_page) { CheckoutDeliveryPage.new }
  let(:user) { create(:user) }

  before do
    create(:delivery_type)
    user.orders.create(status: 1)
    sign_in user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'when params are valid' do
    before do
      current_page.deliveries.first.click
      current_page.save.click
    end

    it { expect(current_page).to have_text I18n.t(:credit_card) }
  end

  describe 'when params are invalid' do
    it do
      current_page.save.click
      expect(current_page).to have_text I18n.t('errors.messages.blank')
    end
  end
end
