# frozen_string_literal: true

RSpec.describe 'QuickRegistration', type: :feature, js: true do
  let(:current_page) { QuickRegistrationPage.new }

  before { current_page.load }

  describe 'when log in' do
    let(:user) { create(:user) }

    before do
      current_page.log_in_form.email.fill_in(with: user.email)
      current_page.log_in_form.password.fill_in(with: password)
      current_page.log_in_form.log_in.click
    end

    describe 'when params is valid' do
      let(:password) { user.password }

      it { expect(current_page).to have_content I18n.t('devise.sessions.signed_in') }
    end

    describe 'when params is invalid' do
      let(:password) { FFaker::Internet.password }

      it { expect(current_page).to have_content I18n.t('devise.failure.invalid', authentication_keys: 'Email') }
    end
  end

  it 'redirect to forgot password' do
    current_page.log_in_form.forgot_password.click
    expect(current_page.current_url).to end_with(NewPassword.url)
  end

  describe 'when quick registration' do
    before do
      current_page.registration.email.fill_in(with: email)
      current_page.registration.continue.click
    end

    describe 'when params is valid' do
      let(:email) { FFaker::Internet.email }

      it { expect(current_page).to have_content I18n.t('devise.registrations.signed_up') }
    end

    describe 'when params is invalid' do
      let(:email) { FFaker::AnimalUS.common_name }

      it { expect(current_page).to have_content I18n.t('errors.messages.invalid') }
    end
  end
end
