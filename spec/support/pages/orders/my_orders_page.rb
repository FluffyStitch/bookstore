# frozen_string_literal: true

class MyOrders < SitePrism::Page
  set_url '/orders{?query*}'

  elements :orders, '[id^=order_]'
end
