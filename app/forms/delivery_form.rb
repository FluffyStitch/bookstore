# frozen_string_literal: true

class DeliveryForm < Reform::Form
  include Reform::Form::ActiveRecord

  property :delivery_type_id

  validates :delivery_type_id, presence: true
end
