# frozen_string_literal: true

require_relative 'order_items_section'

class CartPage < SitePrism::Page
  set_url '/cart'

  sections :order_items, OrderItems, '[id^=order_item_]'

  section :form, '.simple_form' do
    element :coupon, '#order_coupon_code'

    element :apply, '[type="submit"]'
  end

  element :order_total, '#order_total'
end
