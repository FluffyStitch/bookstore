# frozen_string_literal: true

class CheckoutCompletePage < SitePrism::Page
  set_url '/checkout'

  element :store, '.btn-default'
end
