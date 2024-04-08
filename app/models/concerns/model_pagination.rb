# frozen_string_literal: true

module ModelPagination
  extend ActiveSupport::Concern

  included do
    def self.paginate_with(opts = {})
      processed_opts = process_opts(opts.to_h.symbolize_keys)
      query = where(nil)
      query = query.order(**processed_opts[:order]) if processed_opts[:order].present?
      query
        .page(processed_opts[:page])
        .per(processed_opts[:per])
    end

    def self.process_opts(opts)
      {
        order: opts[:order] || {},
        per: opts[:per] || 25,
        page: opts[:page] || 1
      }
    end
  end
end
