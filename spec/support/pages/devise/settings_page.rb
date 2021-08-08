# frozen_string_literal: true

class Settings < SitePrism::Page
  set_url '/users/edit'

  element :address_tab, '[href="#address"]'
  element :privacy_tab, '[href="#privacy"]'

  section :billing_form, AddressInput, '#billing_address'
  section :shipping_form, AddressInput, '#shipping_address'

  section :email_form, '#email-form' do
    element :email, '#user_email'

    element :save, '[type="submit"]'
  end

  section :password_form, '#password-form' do
    element :old_password, '#user_current_password'
    element :password, '#user_password'
    element :password_confirmation, '#user_password_confirmation'

    element :save, '[type="submit"]'
  end

  section :remove_form, '.user' do
    element :checkbox, '.checkbox-icon'

    element :remove, '[type="submit"]'
  end
end
