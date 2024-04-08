# frozen_string_literal: true

RSpec.shared_examples 'paginated_request' do
  it do
    request
    json_body = JSON.parse(response.body).deep_symbolize_keys
    pagination_keys = json_body.dig(:data, :pagination).keys

    expect(pagination_keys).to include(:current_page, :next_page, :prev_page, :total_pages, :limit, :total_items)
  end
end
