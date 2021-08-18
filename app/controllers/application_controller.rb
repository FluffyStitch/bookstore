# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  helper_method :categories, :order_count

  private

  def categories
    Category.all
  end

  def order_count
    order = user_signed_in? ? current_user.current_order : Order.find_by(id: session[:cart_id])
    order&.order_items&.sum(&:quantity) || 0
  end
end
