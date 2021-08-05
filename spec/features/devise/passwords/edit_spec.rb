# frozen_string_literal: true

RSpec.describe 'Edit Password', type: :feature, js: true do
  let(:current_page) { EditPassword.new }
  let(:user) { create(:user) }
  let(:reset_password_token) do
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    { raw: raw, hashed: hashed }
  end

  before do
    user.reset_password_token = reset_password_token[:hashed]
    user.reset_password_sent_at = Time.now.utc
    user.save(validate: false)
    current_page.load(token: { reset_password_token: reset_password_token[:raw] })
  end

  it { expect(current_page).to be_displayed }

  describe 'set new password' do
    let(:password) { attributes_for(:user)[:password] }

    before do
      current_page.form.password.fill_in(with: password)
      current_page.form.password_confirmation.fill_in(with: password_confirmation)
      current_page.form.change.click
    end

    describe 'when params is valid' do
      let(:password_confirmation) { password }

      it 'success' do
        expect(current_page).to have_content 'Your password has been changed successfully.'
      end
    end

    describe 'when password confirmation is not correct' do
      let(:password_confirmation) { attributes_for(:user)[:password] }

      it 'failed' do
        expect(current_page).to have_content "doesn't match"
      end
    end
  end
end
