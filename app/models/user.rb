# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/.freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:github]

  validates :password, format: { with: PASSWORD_REGEX }, if: :password_required?
end
