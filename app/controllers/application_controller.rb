# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  helper_method :categories, :cart_count

  private

  def categories
    Category.all
  end

  def current_cart
    @current_cart ||= user_signed_in? ? user_cart : guest_cart
  end

  def user_cart
    current_user.current_order || current_user.create_current_order
  end

  def guest_cart
    if session[:cart_id]
      Order.find(session[:cart_id])
    else
      cart = Order.create
      session[:cart_id] = cart.id
      cart
    end
  end

  def cart_count
    current_cart.order_items.sum(&:quantity) || 0
  end
end
