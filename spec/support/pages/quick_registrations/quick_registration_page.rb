# frozen_string_literal: true

class QuickRegistrationPage < SitePrism::Page
  set_url '/quick_registration'

  section :log_in_form, '#log_in' do
    element :email, '#user_email'
    element :password, '#user_password'

    element :forgot_password, '.help-block'

    element :log_in, '[type="submit"]'
  end

  section :registration, '#quick_reg' do
    element :email, '#user_email'

    element :continue, '[type="submit"]'
  end
end
