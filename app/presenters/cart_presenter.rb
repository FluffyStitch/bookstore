# frozen_string_literal: true

class CartPresenter < ApplicationPresenter
  attr_reader :cart

  def initialize(cart)
    super()
    @cart = cart
  end

  def sub_total
    @cart.order_items.inject(0) { |sum, item| sum + item.book.price * item.quantity }
  end

  def discount
    @cart.coupon ? (sub_total * @cart.coupon.discount).round(2) : 0.0
  end

  def order_total
    sub_total - discount
  end
end
