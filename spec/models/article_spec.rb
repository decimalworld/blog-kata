# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  let(:article) { build(:article) }

  context 'when validate' do
    it { expect(article).to validate_presence_of(:title) }
    it { expect(article).to validate_presence_of(:summary) }
    it { expect(article).to validate_presence_of(:body) }
  end

  context 'when associate' do
    it { expect(article).to belong_to(:author) }
  end
end
