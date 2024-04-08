# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guests::SessionsController do
  let(:user) { create(:user) }
  let(:payload) { { email: user.email, password: 'password' } }
  let(:request) { post '/guests/sign_in', params: { guest: payload } }

  describe 'user sign in' do
    context 'when incorrect password is provided' do
      let(:payload) { { email: user.email, password: 'invalid password' } }

      it do
        request
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when correct password is provided' do
      it do
        request
        expect(response).to have_http_status(:success)
      end
    end
  end
end
