# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :set_forms, only: %i[edit update]

  def update_resource(resource, params)
    password_present? ? super(resource, params) : update_without_password(resource, params)
  end

  private

  def password_present?
    params.dig(:user, :password)
  end

  def update_without_password(resource, params)
    resource.update_without_password(params)
  end

  def set_forms
    billing = current_user.billing_address || BillingAddress.new(user_id: current_user.id)
    shipping = current_user.shipping_address || ShippingAddress.new(user_id: current_user.id)
    @billing_address_form = AddressForm.new(billing)
    @shipping_address_form = AddressForm.new(shipping)
  end
end
