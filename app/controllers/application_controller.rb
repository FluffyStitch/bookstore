# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SimpleEndpoint::Controller
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def default_cases
    {
      success: ->(result) { result.success? },
      invalid: ->(result) { result.failure? }
    }
  end

  def default_handler
    {
      success: ->(result, **opts) { render json: result['model'], **opts, status: 200 },
      invalid: lambda { |result, **|
                 render json: result['contract.default'].errors, serializer: ErrorSerializer,
                        status: :unprocessable_entity
               }
    }
  end

  def endpoint_options
    { params: params }
  end

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
end
