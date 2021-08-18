# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :presenter, :current_cart

  def update
    @order_item = Order::UpdateOrderItems.new(cart: current_cart, params: order_params[:order_item]).call
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: I18n.t(:book_added)) }
      format.js
    end
  end

  def add_coupon
    coupon = Coupon.find_by(code: order_params[:coupon][:code])
    cart_form = CartForm.new(current_cart)
    cart_form.save if cart_form.validate({ coupon: coupon })
    message = cart_form.valid? ? { notice: I18n.t(:coupon_added) } : { alert: cart_form.errors[:coupon].join(', ') }
    redirect_to cart_path, **message
  end

  def destroy_order_item
    @order_item = current_cart.order_items.find_by(id: order_params[:order_item][:id])
    @order_item.destroy
  end

  private

  def order_params
    params.require(:order).permit(coupon: :code, order_item: %i[id quantity book_id])
  end

  def presenter
    @presenter ||= CartPresenter.new(current_cart)
  end

  def current_cart
    @current_cart ||= Order::CurrentCart.new(current_user, session, user_signed_in?).current_cart
  end
end
