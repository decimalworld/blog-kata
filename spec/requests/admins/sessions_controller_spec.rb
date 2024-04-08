# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::SessionsController do
  let(:admin) { create(:user, :admin) }

  describe 'sign in a admin' do
    context 'when correct password are provided' do
      it do
        post('/admins/sign_in', params: { admin: { email: admin.email, password: 'password' } })
        expect(response).to have_http_status(:success)
      end
    end

    context 'when incorrect password are provided' do
      it do
        post('/admins/sign_in', params: { admin: { email: admin.email, pasword: 'incorrect password' } })
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
