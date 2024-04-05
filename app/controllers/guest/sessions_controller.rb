# frozen_string_literal: true

module Guest
  class SessionsController < Devise::SessionsController
    def respond_with(resource, *)
      sign_out
      render json: resource
    end
  end
end
