# frozen_string_literal: true

RSpec.describe 'Checkout > Address', type: :feature, js: true do
  let(:current_page) { CheckoutAddressPage.new }
  let(:user) { create(:user) }

  before do
    user.create_current_order
    sign_in user
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'when params are valid' do
    let(:billing) { attributes_for(:billing_address) }

    describe 'when both addresses' do
      let(:shipping) { attributes_for(:shipping_address) }

      before do
        current_page.billing_form.first_name.fill_in(with: billing[:first_name])
        current_page.billing_form.last_name.fill_in(with: billing[:last_name])
        current_page.billing_form.address.fill_in(with: billing[:address])
        current_page.billing_form.city.fill_in(with: billing[:city])
        current_page.billing_form.zip.fill_in(with: billing[:zip])
        current_page.billing_form.country.select(billing[:country])
        current_page.billing_form.phone.fill_in(with: billing[:phone])
        current_page.shipping_form.first_name.fill_in(with: billing[:first_name])
        current_page.shipping_form.last_name.fill_in(with: billing[:last_name])
        current_page.shipping_form.address.fill_in(with: billing[:address])
        current_page.shipping_form.city.fill_in(with: billing[:city])
        current_page.shipping_form.zip.fill_in(with: billing[:zip])
        current_page.shipping_form.country.select(billing[:country])
        current_page.shipping_form.phone.fill_in(with: billing[:phone])
        current_page.save.click
      end

      it { expect(current_page).to have_text I18n.t(:delivery_type) }
    end

    describe 'when use only billing address' do
      before do
        current_page.billing_form.first_name.fill_in(with: billing[:first_name])
        current_page.billing_form.last_name.fill_in(with: billing[:last_name])
        current_page.billing_form.address.fill_in(with: billing[:address])
        current_page.billing_form.city.fill_in(with: billing[:city])
        current_page.billing_form.zip.fill_in(with: billing[:zip])
        current_page.billing_form.country.select(billing[:country])
        current_page.billing_form.phone.fill_in(with: billing[:phone])
        current_page.use_billing.click
        current_page.save.click
      end

      it { expect(current_page).to have_text I18n.t(:delivery_type) }
    end
  end

  describe 'when params are invalid' do
    let(:billing) { attributes_for(:billing_address, first_name: '') }

    describe 'when both addresses' do
      before do
        current_page.billing_form.first_name.fill_in(with: billing[:first_name])
        current_page.billing_form.last_name.fill_in(with: billing[:last_name])
        current_page.billing_form.address.fill_in(with: billing[:address])
        current_page.billing_form.city.fill_in(with: billing[:city])
        current_page.billing_form.zip.fill_in(with: billing[:zip])
        current_page.billing_form.country.select(billing[:country])
        current_page.billing_form.phone.fill_in(with: billing[:phone])
        current_page.shipping_form.first_name.fill_in(with: billing[:first_name])
        current_page.shipping_form.last_name.fill_in(with: billing[:last_name])
        current_page.shipping_form.address.fill_in(with: billing[:address])
        current_page.shipping_form.city.fill_in(with: billing[:city])
        current_page.shipping_form.zip.fill_in(with: billing[:zip])
        current_page.shipping_form.country.select(billing[:country])
        current_page.shipping_form.phone.fill_in(with: billing[:phone])
        current_page.save.click
      end

      it { expect(current_page).to have_text I18n.t('errors.messages.blank') }
    end

    describe 'when use only billing address' do
      before do
        current_page.billing_form.first_name.fill_in(with: billing[:first_name])
        current_page.billing_form.last_name.fill_in(with: billing[:last_name])
        current_page.billing_form.address.fill_in(with: billing[:address])
        current_page.billing_form.city.fill_in(with: billing[:city])
        current_page.billing_form.zip.fill_in(with: billing[:zip])
        current_page.billing_form.country.select(billing[:country])
        current_page.billing_form.phone.fill_in(with: billing[:phone])
        current_page.use_billing.click
        current_page.save.click
      end

      it { expect(current_page).to have_text I18n.t('errors.messages.blank') }
    end
  end
end
