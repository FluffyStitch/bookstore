# frozen_string_literal: true

class PaymentForm < Reform::Form
  include Reform::Form::ActiveRecord

  LENGTH = {
    name: 50,
    min_cvv: 3,
    max_cvv: 4
  }.freeze

  REGEX = {
    numeric: /\A\d+\z/,
    name: /\A[a-zA-Z\s]+\z/,
    date: %r/\A(0[1-9]|10|11|12)\/[0-9]{2}\z/
  }.freeze

  property :number
  property :name
  property :validity
  property :cvv

  validates :number, presence: true, format: { with: REGEX[:numeric] }
  validates :name, presence: true, format: { with: REGEX[:name] }, length: { maximum: LENGTH[:name] }
  validates :validity, presence: true, format: { with: REGEX[:date] }
  validates :cvv, presence: true, format: { with: REGEX[:numeric] },
                  length: { minimum: LENGTH[:min_cvv], maximum: LENGTH[:max_cvv] }
end
