# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/.freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:github]

  has_one :billing_address, class_name: 'BillingAddress', dependent: :destroy
  has_one :shipping_address, class_name: 'ShippingAddress', dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :password, format: { with: PASSWORD_REGEX }, if: :password_required?
end
