# frozen_string_literal: true

module ResponseHandler
  extend ActiveSupport::Concern

  def response_with_serializer(resource, opts = {}, status: 200)
    render json: {
      status:,
      message: 'success',
      data: ActiveModelSerializers::SerializableResource.new(resource, opts).as_json
    }, status:
  end

  def response_with_pagination(resource, opts = {}, status: 200)
    render json: {
      status:,
      message: 'success',
      data: {
        items: ActiveModelSerializers::SerializableResource.new(resource, opts).as_json,
        pagination: {
          current_page: resource.current_page,
          next_page: resource.next_page,
          prev_page: resource.prev_page,
          total_pages: resource.total_pages,
          limit: resource.limit_value,
          total_items: resource.count
        }
      }
    }, status:
  end
end
