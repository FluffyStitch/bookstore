# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def order_completed(presenter, user)
    @presenter = presenter
    mail(to: user.email, subject: @presenter.cart.uniq_number.to_s)
  end
end
