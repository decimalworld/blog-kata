# frozen_string_literal: true

module Admin
  class SessionsController < Devise::SessionsController
    def respond_with(resource, *)
      sign_out
      render json: resource
    end
  end
end
