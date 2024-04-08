# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::ArticlesController do
  describe 'create new article' do
    let(:payload) { attributes_for(:article) }
    let(:user) { create(:user, :admin) }

    let(:request) { post('/admins/articles', params: { article: payload }) }

    context 'when user not signed in' do
      it do
        request
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when user with wrong permission signed in' do
      let(:user) { create(:user) }

      before do
        sign_in user
        "Bearer #{user.token}"
      end

      it do
        request
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when user signed in but payload is invalid' do
      let(:payload) { {} }

      before do
        sign_in user
      end

      it do
        request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user signed in and payload is valid' do
      before do
        sign_in user
      end

      it do
        expect { request }.to change(Article, :count).by(1)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
