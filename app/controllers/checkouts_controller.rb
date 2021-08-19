# frozen_string_literal: true

class CheckoutsController < ApplicationController
  STATUSES = {
    address: { service: Checkout::UpdateAddress, template: :update_address },
    delivery: { service: Checkout::Delivery, template: :delivery },
    payment: { service: Checkout::Payment, template: :payment }
  }.freeze

  before_action :set_forms, :presenter, :current_order

  def create
    current_user.order_in_progress = current_user.current_order
    redirect_to checkout_path
  end

  def update
    status = STATUSES[current_order.status.to_sym]
    service = status[:service].new(current_order, order_params)
    service.call
    return redirect_to checkout_path if service.success?

    @form = service.form
    render status[:template]
  end

  def update_status
    current_order.update(status: params[:status]) if params[:status]
    send_email if params[:status]&.to_sym == :complete

    redirect_to checkout_path
  end

  private

  def order_params
    params.fetch(:order, {})
  end

  def presenter
    @presenter = CartPresenter.new(current_order)
  end

  def set_forms
    billing = current_order.billing_address || BillingAddress.new(addressable_id: current_order.id,
                                                                  addressable_type: current_order.class)
    shipping = current_order.shipping_address || ShippingAddress.new(addressable_id: current_order.id,
                                                                     addressable_type: current_order.class)
    @billing_address_form = AddressForm.new(billing)
    @shipping_address_form = AddressForm.new(shipping)
  end

  def current_order
    @current_order ||= current_user.order_in_progress
  end

  def send_email
    UserMailer.order_completed(presenter, current_user).deliver
  end
end
