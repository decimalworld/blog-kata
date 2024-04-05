# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  attribute :token, if: :with_token?
  attributes :created_at, :updated_at

  def with_token?
    Rails.logger.debug object.token
    object.token
  end
end
