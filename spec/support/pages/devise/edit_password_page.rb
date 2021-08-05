# frozen_string_literal: true

class EditPassword < SitePrism::Page
  set_url '/users/password/edit{?token*}'

  section :form, '#new_user' do
    element :password, '#user_password'
    element :password_confirmation, '#user_password_confirmation'

    element :change, '[type="submit"]'
  end
end
