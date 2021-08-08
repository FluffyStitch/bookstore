# frozen_string_literal: true

class UserPresenter < ApplicationPresenter
  def initialize(user)
    super()
    @user = user
  end

  def billing_address
    @user.billing_address || BillingAddress.new(user_id: @user.id)
  end

  def shipping_address
    @user.shipping_address || ShippingAddress.new(user_id: @user.id)
  end
end
