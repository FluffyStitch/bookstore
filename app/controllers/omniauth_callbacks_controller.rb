# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  GITHUB = 'GitHub'

  def github
    @user = User::FromOmniAuth.call(request.env['omniauth.auth'])
    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: GITHUB) if is_navigational_format?
  end

  def failure
    redirect_to root_path
    set_flash_message(:error, :failure, kind: GITHUB) if is_navigational_format?
  end
end
