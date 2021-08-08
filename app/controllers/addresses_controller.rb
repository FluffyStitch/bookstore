# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authenticate_user!

  def update
    @address = address
    return render :update unless @address.validate(address_params)

    @address.save
    redirect_to(edit_user_registration_path, notice: I18n.t(:address_updated))
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :country, :city, :address, :zip, :phone, :type)
  end

  def address
    AddressForm.new(current_user.public_send(address_params[:type].underscore) || Address.new(user_id: current_user.id))
  end
end
