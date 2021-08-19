# frozen_string_literal: true

class CheckoutConfirmPage < SitePrism::Page
  set_url '/checkout'

  elements :edits, '.general-edit'

  element :save, '.btn-default'
end
