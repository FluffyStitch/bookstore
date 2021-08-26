# frozen_string_literal: true

class CheckoutCreditCardPage < SitePrism::Page
  set_url '/checkout'

  section :form, '.simple_form' do
    element :number, '#credit_card_number'
    element :name, '#credit_card_name'
    element :validity, '#credit_card_validity'
    element :cvv, '#credit_card_cvv'
  end

  element :save, '[type="submit"]'
end
