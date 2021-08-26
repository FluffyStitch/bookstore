# frozen_string_literal: true

class ViewOrderPage < SitePrism::Page
  set_url '/admin/orders/{id}'

  element :in_progress, '.in_progress'
  element :delivered, '.delivered'
  element :canceled, '.canceled'

  element :in_delivery_button, '#in_delivery'
  element :delivered_button, '#delivered'
  element :canceled_button, '#canceled'
end
