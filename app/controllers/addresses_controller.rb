# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authenticate_user!

  def update
    @address_form = address_form
    return render :update unless @address_form.validate(address_params)

    @address_form.save
    redirect_to(edit_user_registration_path, notice: I18n.t(:address_updated))
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :country, :city, :address, :zip, :phone, :type)
  end

  def address_form
    address = current_user.public_send(address_params[:type].underscore) || Address.new(
      addressable_id: current_user.id, addressable_type: current_user.class
    )
    AddressForm.new(address)
  end
end
