# frozen_string_literal: true

class Order
  class TransferCart
    attr_reader :message

    def initialize(user, session)
      @user = user
      @session = session
    end

    def call
      @user.current_order = Order.find_by(id: @session[:cart_id])
      @session[:cart_id] = nil
    end
  end
end
