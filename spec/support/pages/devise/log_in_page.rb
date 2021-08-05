# frozen_string_literal: true

class LogIn < SitePrism::Page
  set_url '/users/sign_in'

  section :github, Github, '.general-login-icon'

  section :form, '#new_user' do
    element :email, '#user_email'
    element :password, '#user_password'

    element :forgot_password, '.help-block'

    element :sign_in, '[type="submit"]'
  end

  element :sign_up, '#sign_up'
end
