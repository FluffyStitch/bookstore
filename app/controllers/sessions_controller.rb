# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super do
      Order::TransferCart.new(resource, session).call if session[:cart_id]
    end
  end
end
