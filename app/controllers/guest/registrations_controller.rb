# frozen_string_literal: true

module Guest
  class RegistrationsController < Devise::RegistrationsController
    def create
      super { |resource| raise ActiveRecord::RecordInvalid, resource unless resource.persisted? }
    end

    def respond_with(_resouce, *)
      sign_out
      render json: resource
    end
  end
end
