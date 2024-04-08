# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'application_service' do
  it do
    expect(described_class).to respond_to(:execute)
  end
end
