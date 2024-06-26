# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_respond
    rescue_from ActionController::ParameterMissing, with: :missing_params_respond
  end

  def invalid_record_respond(exception)
    render json: {
      code: 422,
      message: 'error',
      errors: exception.record.errors.full_messages
    }, status: :unprocessable_entity
  end

  def missing_params_respond(exception)
    render json: {
      code: 422,
      message: 'error',
      errors: [exception.message]
    }, status: :unprocessable_entity
  end
end
