# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guests::RegistrationsController do
  let(:user) { attributes_for(:user) }

  describe 'register new user' do
    let(:payload) { user }
    let(:request) { post '/guests', params: { guest: payload } }

    context 'when valid user attributes is given' do
      it do
        expect { request }.to change(Users::Guest, :count).by(1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'when invalid user attributes is given' do
      let(:payload) { {} }

      it do
        expect { request }.not_to(change(Users::Guest, :count))
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
