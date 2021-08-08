# frozen_string_literal: true

RSpec.describe 'Log In', type: :feature, js: true do
  let(:current_page) { LogIn.new }
  let!(:user) { create(:user) }

  before do
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'redirect to github' do
    current_page.github.icon.click

    expect(current_page.current_url).to include('github')
  end

  describe 'log in' do
    before do
      current_page.form.email.fill_in(with: user.email)
      current_page.form.password.fill_in(with: password)
      current_page.form.sign_in.click
    end

    context 'when params is valid' do
      let(:password) { user.password }

      it 'success' do
        expect(current_page).to have_content I18n.t('devise.sessions.signed_in')
      end
    end

    context 'when password is not correct' do
      let(:password) { FFaker::AnimalUS.common_name }

      it 'failed' do
        expect(current_page).to have_content I18n.t('devise.failure.invalid', authentication_keys: 'Email')
      end
    end
  end

  it 'redirect to sign up page' do
    current_page.sign_up.click

    expect(current_page).to have_content I18n.t(:have_account)
  end
end
