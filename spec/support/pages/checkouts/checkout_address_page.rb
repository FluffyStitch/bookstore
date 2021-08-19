# frozen_string_literal: true

class CheckoutAddressPage < SitePrism::Page
  set_url '/checkout'

  section :billing_form, AddressFields, '#billing_address_form'
  section :shipping_form, AddressFields, '#shipping_address_form'

  element :use_billing, '.checkbox-icon'

  element :save, '[type="submit"]'
end
