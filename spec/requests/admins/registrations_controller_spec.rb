# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::RegistrationsController do
  let(:admin) { attributes_for(:user, :admin) }

  describe 'register a new user' do
    let(:payload) { admin }

    let(:request) { post('/admins/', params: { admin: payload }) }

    context 'when admin attributes are provided' do
      it do
        expect { request }.to change(Users::Admin, :count).by(1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'when admin attributes are not provided' do
      let(:payload) { {} }

      it do
        expect { request }.not_to(change(Users::Admin, :count))
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
