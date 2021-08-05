# frozen_string_literal: true

RSpec.describe 'New Password', type: :feature, js: true do
  let(:current_page) { NewPassword.new }

  before do
    current_page.load
  end

  it { expect(current_page).to be_displayed }

  describe 'send email' do
    before do
      current_page.form.email.fill_in(with: email)
      current_page.form.instructions.click
    end

    context 'when email is valid' do
      let(:user) { create(:user) }
      let(:email) { user.email }

      it { expect(current_page).to have_content I18n.t('devise.passwords.send_instructions') }
    end

    context 'when email is invalid' do
      let(:email) { attributes_for(:user)[:email] }

      it { expect(current_page).to have_content I18n.t('errors.messages.not_found') }
    end
  end

  it 'redirect to log in page' do
    current_page.cancel.click

    expect(current_page).to have_content I18n.t(:not_have_account)
  end
end
