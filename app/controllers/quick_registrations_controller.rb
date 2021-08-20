# frozen_string_literal: true

class QuickRegistrationsController < ApplicationController
  include Devise::Mailers::Helpers

  def create
    @user = User.new(quick_registrations_params)
    @user.skip_confirmation!
    if @user.save
      @user.send_reset_password_instructions
      Order::TransferCart.new(@user, session).call
      sign_in @user
      redirect_to checkout_path, notice: I18n.t('devise.registrations.signed_up')
    else render :create
    end
  end

  private

  def quick_registrations_params
    password = Devise.friendly_token
    params.require(:user).permit(:email).merge(password: password, password_confirmation: password)
  end
end
