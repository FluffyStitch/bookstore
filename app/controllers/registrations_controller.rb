# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    password_present? ? super(resource, params) : update_without_password(resource, params)
  end

  private

  def password_present?
    params.dig(:user, :password)
  end

  def update_without_password(resource, params)
    resource.update_without_password(params)
  end
end
