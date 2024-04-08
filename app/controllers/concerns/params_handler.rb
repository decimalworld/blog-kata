# frozen_string_literal: true

module ParamsHandler
  extend ActiveSupport::Concern

  def pagination_params
    params.permit(filter: [:per, :page, { order: {} }])
  end
end
