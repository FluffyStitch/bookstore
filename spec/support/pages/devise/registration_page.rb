# frozen_string_literal: true

class Registration < SitePrism::Page
  set_url '/users/sign_up'

  section :github, Github, '.general-login-icon'

  section :form, '#new_user' do
    element :email, '#user_email'
    element :password, '#user_password'
    element :password_confirmation, '#user_password_confirmation'

    element :sign_up, '[type="submit"]'
  end

  element :log_in, '.in-gold-500'
end
