# frozen_string_literal: true

class NewPassword < SitePrism::Page
  set_url '/users/password/new'

  section :form, '#new_user' do
    element :email, '#user_email'

    element :instructions, '[type="submit"]'
  end

  element :cancel, '.in-gold-500'
end
