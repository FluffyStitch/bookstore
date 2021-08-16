# frozen_string_literal: true

class OrdersPage < SitePrism::Page
  set_url '/admin/orders'

  element :in_progress, '.in_progress'
  element :delivered, '.delivered'
  element :canceled, '.canceled'

  element :view, '.view_link'
end
