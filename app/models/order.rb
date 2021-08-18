# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items
  has_one :coupon, dependent: :destroy

  enum status: { in_progress: 0, in_queue: 1, in_delivery: 2, delivered: 3, canceled: 4 }
end
