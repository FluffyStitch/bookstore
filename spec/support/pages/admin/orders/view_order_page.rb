# frozen_string_literal: true

class ViewOrderPage < SitePrism::Page
  set_url '/admin/orders/{id}'

  element :delivered, '#delivered'
  element :canceled, '#canceled'
end
