# frozen_string_literal: true

class CheckoutDeliveryPage < SitePrism::Page
  set_url '/checkout'

  elements :deliveries, '.radio-icon'

  element :save, '[type="submit"]'
end
