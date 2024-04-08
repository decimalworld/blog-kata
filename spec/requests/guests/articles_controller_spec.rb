# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guests::ArticlesController do
  describe 'show all articles' do
    let(:request) { get '/guests/articles' }

    it_behaves_like('paginated_request')
    it do
      request
      expect(response).to have_http_status(:success)
    end
  end

  describe 'get article by slug' do
    let(:article) { create(:article) }
    let(:request) { get "/guests/articles/#{article.slug}" }

    it do
      request
      expect(response).to have_http_status(:success)
    end
  end
end
