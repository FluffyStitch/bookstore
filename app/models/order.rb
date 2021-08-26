# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM

  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items
  has_one :coupon, dependent: :destroy
  has_one :billing_address, as: :addressable, class_name: 'BillingAddress', dependent: :destroy
  has_one :shipping_address, as: :addressable, class_name: 'ShippingAddress', dependent: :destroy
  belongs_to :delivery_type, optional: true
  has_one :credit_card, dependent: :destroy

  enum status: { address: 0, delivery: 1, payment: 2, confirm: 3, complete: 4, in_delivery: 5, delivered: 6,
                 canceled: 7 }

  aasm column: :status, enum: true do
    state :address, initial: true
    state :delivery, :payment, :confirm, :complete, :in_delivery, :delivered, :canceled

    event(:delivery_status) { transitions from: :address, to: :delivery }
    event(:payment_status) { transitions from: :delivery, to: :payment }
    event(:confirm_status) { transitions from: :payment, to: :confirm }
    event(:complete_status) { transitions from: :confirm, to: :complete }
    event(:in_delivery_status) { transitions from: :complete, to: :in_delivery }
    event(:delivered_status) { transitions from: :in_delivery, to: :delivered }
    event(:canceled_status) do
      transitions from: %i[address delivery payment confirm complete in_delivery delivered], to: :canceled
    end
  end
end
