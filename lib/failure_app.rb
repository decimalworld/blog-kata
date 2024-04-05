# frozen_string_literal: true

class FailureApp < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = :json
    self.response_body = {
      code: 401,
      message: 'error',
      errors: [i18n_message]
    }.to_json
  end
end
