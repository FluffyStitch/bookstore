# frozen_string_literal: true

class OrderForm < Reform::Form
  include Reform::Form::ActiveRecord

  property :billing_address, form: AddressForm, populate_if_empty: BillingAddress
  property :shipping_address, form: AddressForm, populate_if_empty: ShippingAddress

  validates :billing_address, presence: true
  validates :shipping_address, presence: true
end
