# frozen_string_literal: true

RSpec.describe 'Checkout > CreditCard', type: :feature, js: true do
  let(:current_page) { CheckoutCreditCardPage.new }
  let(:user) { create(:user) }
  let(:order) { user.orders.create(attributes_for(:order)) }

  before do
    order.update(status: 2)
    order.update(delivery_type_id: create(:delivery_type).id)
    order.update(billing_address: create(:billing_address, addressable_id: order.id, addressable_type: order.class))
    order.update(shipping_address: create(:shipping_address, addressable_id: order.id, addressable_type: order.class))
    sign_in user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'when params are valid' do
    let(:credit_card) { attributes_for(:credit_card) }

    before do
      current_page.form.number.fill_in(with: credit_card[:number])
      current_page.form.name.fill_in(with: credit_card[:name])
      current_page.form.validity.fill_in(with: credit_card[:validity])
      current_page.form.cvv.fill_in(with: credit_card[:cvv])
      current_page.save.click
    end

    it { expect(current_page).to have_text I18n.t(:payment_info) }
  end

  describe 'when params are invalid' do
    let(:credit_card) { attributes_for(:credit_card, number: '') }

    before do
      current_page.form.number.fill_in(with: credit_card[:number])
      current_page.form.name.fill_in(with: credit_card[:name])
      current_page.form.validity.fill_in(with: credit_card[:validity])
      current_page.form.cvv.fill_in(with: credit_card[:cvv])
      current_page.save.click
    end

    it { expect(current_page).to have_text I18n.t('errors.messages.blank') }
  end
end
