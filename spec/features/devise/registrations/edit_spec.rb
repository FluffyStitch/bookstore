# frozen_string_literal: true

RSpec.describe 'Settings', type: :feature, js: true do
  let(:current_page) { Settings.new }
  let!(:user) { create(:user) }

  before do
    sign_in user
    current_page.load
  end

  describe 'billing address' do
    before do
      current_page.billing_form.first_name.fill_in(with: params[:first_name])
      current_page.billing_form.last_name.fill_in(with: params[:last_name])
      current_page.billing_form.address.fill_in(with: params[:address])
      current_page.billing_form.city.fill_in(with: params[:city])
      current_page.billing_form.zip.fill_in(with: params[:zip])
      current_page.billing_form.country.select(params[:country])
      current_page.billing_form.phone.fill_in(with: params[:phone])
      current_page.billing_form.save.click
    end

    context 'when params is valid' do
      let(:params) { attributes_for(:billing_address) }

      it { expect(current_page).to have_content(I18n.t(:address_updated)) }
    end

    context 'when params is invalid' do
      let(:params) { attributes_for(:billing_address, first_name: '') }

      it { expect(current_page).to have_content(I18n.t('errors.messages.blank')) }
    end
  end

  describe 'shipping address' do
    before do
      current_page.shipping_form.first_name.fill_in(with: params[:first_name])
      current_page.shipping_form.last_name.fill_in(with: params[:last_name])
      current_page.shipping_form.address.fill_in(with: params[:address])
      current_page.shipping_form.city.fill_in(with: params[:city])
      current_page.shipping_form.zip.fill_in(with: params[:zip])
      current_page.shipping_form.country.select(params[:country])
      current_page.shipping_form.phone.fill_in(with: params[:phone])
      current_page.shipping_form.save.click
    end

    context 'when params is valid' do
      let(:params) { attributes_for(:shipping_address) }

      it { expect(current_page).to have_content(I18n.t(:address_updated)) }
    end

    context 'when params is invalid' do
      let(:params) { attributes_for(:shipping_address, first_name: '') }

      it { expect(current_page).to have_content(I18n.t('errors.messages.blank')) }
    end
  end

  describe 'edit email' do
    before do
      current_page.privacy_tab.click
      current_page.email_form.email.fill_in(with: email)
      current_page.email_form.save.click
    end

    context 'when params is valid' do
      let(:email) { attributes_for(:user)[:email] }

      it { expect(current_page).to have_content(I18n.t('devise.registrations.updated')) }
    end

    context 'when params is invalid' do
      let(:email) { '' }

      it do
        current_page.privacy_tab.click
        expect(current_page).to have_content(I18n.t('errors.messages.blank'))
      end
    end
  end

  describe 'edit password' do
    before do
      current_page.privacy_tab.click
      current_page.password_form.old_password.fill_in(with: user.password)
      current_page.password_form.password.fill_in(with: password)
      current_page.password_form.password_confirmation.fill_in(with: password_confirmation)
      current_page.password_form.save.click
    end

    context 'when params is valid' do
      let(:password) { attributes_for(:user)[:password] }
      let(:password_confirmation) { password }

      it { expect(current_page).to have_content(I18n.t('devise.registrations.updated')) }
    end

    context 'when params is invalid' do
      let(:password) { attributes_for(:user)[:password] }
      let(:password_confirmation) { attributes_for(:user)[:password] }

      it do
        current_page.privacy_tab.click
        expect(current_page).to have_content(I18n.t('errors.messages.confirmation',
                                                    attribute: I18n.t('placeholder.password')))
      end
    end
  end

  describe 'remove account' do
    it 'success' do
      current_page.privacy_tab.click
      current_page.remove_form.checkbox.click
      current_page.remove_form.remove.click
      expect(current_page).to have_content(I18n.t('devise.registrations.destroyed'))
    end
  end
end
