# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ErrorHandler
  include ResponseHandler
  include ParamsHandler
  include Pundit::Authorization

  devise_group :user, contains: %i[guest admin]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
