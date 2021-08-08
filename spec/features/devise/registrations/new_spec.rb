# frozen_string_literal: true

RSpec.describe 'Registration', type: :feature, js: true do
  let(:current_page) { Registration.new }
  let(:attributes) { attributes_for(:user) }

  before do
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  it 'redirect to github' do
    current_page.github.icon.click

    expect(current_page.current_url).to include('github')
  end

  describe 'registration a new user' do
    before do
      current_page.form.email.fill_in(with: attributes[:email])
      current_page.form.password.fill_in(with: attributes[:password])
      current_page.form.password_confirmation.fill_in(with: password_confirmation)
      current_page.form.sign_up.click
    end

    context 'when params is valid' do
      let(:password_confirmation) { attributes[:password] }

      it 'success' do
        expect(current_page).to have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')
      end
    end

    context 'when password confirmation is not correct' do
      let(:password_confirmation) { attributes_for(:user)[:password] }

      it 'failed registation a new user' do
        expect(current_page).to have_content(I18n.t('errors.messages.confirmation',
                                                    attribute: I18n.t('placeholder.password')))
      end
    end
  end

  it 'redirect to log in page' do
    current_page.log_in.click

    expect(current_page).to have_content I18n.t('remember')
  end
end
