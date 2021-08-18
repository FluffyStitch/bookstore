# frozen_string_literal: true

class OrdersPage < SitePrism::Page
  set_url '/admin/orders'

  element :view, '.view_link'
end
