# frozen_string_literal: true

class CartForm < Reform::Form
  include Reform::Form::ActiveRecord

  property :coupon

  validate :valid_coupon

  private

  def valid_coupon
    return errors.add(:coupon, I18n.t(:cart_has_coupon)) if model.coupon
    return errors.add(:coupon, I18n.t(:coupon_not_found)) if coupon.nil?

    errors.add(:coupon, I18n.t(:coupon_used)) unless coupon.active
  end
end
