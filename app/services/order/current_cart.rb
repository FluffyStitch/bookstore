# frozen_string_literal: true

class Order
  class CurrentCart
    def initialize(user, session, signed_in)
      @user = user
      @session = session
      @signed_in = signed_in
    end

    def current_cart
      @current_cart ||= @signed_in ? user_cart : guest_cart
    end

    def user_cart
      @user.current_order || @user.create_current_order(uniq_number: Array.new(6) { rand(9) }.join)
    end

    def guest_cart
      if @session[:cart_id]
        Order.find(@session[:cart_id])
      else
        cart = Order.create(uniq_number: Array.new(6) { rand(9) }.join)
        @session[:cart_id] = cart.id
        cart
      end
    end
  end
end
