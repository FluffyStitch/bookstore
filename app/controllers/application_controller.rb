# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  helper_method :categories, :order_count

  private

  def categories
    Category.all
  end

  def current_cart
    @current_cart ||= user_signed_in? ? user_cart : guest_cart
  end

  def user_cart
    current_user.current_order || current_user.create_current_order(uniq_number: Array.new(6) { rand(9) }.join)
  end

  def guest_cart
    if session[:cart_id]
      Order.find(session[:cart_id])
    else
      cart = Order.create(uniq_number: Array.new(6) { rand(9) }.join)
      session[:cart_id] = cart.id
      cart
    end
  end

  def order_count
    order = user_signed_in? ? current_user.current_order : Order.find_by(id: session[:cart_id])
    order&.order_items&.sum(&:quantity) || 0
  end
end
