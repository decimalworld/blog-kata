# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :uuid             not null, primary key
#  body       :string(2000)     not null
#  slug       :string(300)
#  summary    :string(300)      not null
#  title      :string(300)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :uuid             not null
#  cover_id   :uuid
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#  index_articles_on_cover_id   (cover_id)
#  index_articles_on_slug       (slug)
#
require 'rails_helper'

RSpec.describe Article do
  let(:article) { build(:article) }

  it_behaves_like 'paginatable_model'
  context 'when validate' do
    it { expect(article).to validate_presence_of(:title) }
    it { expect(article).to validate_presence_of(:summary) }
    it { expect(article).to validate_presence_of(:body) }
  end

  context 'when associate' do
    it { expect(article).to belong_to(:author) }
    it { expect(article).to have_one(:cover) }
  end

  context 'when save' do
    it do
      expect { article.save! }.not_to raise_error
      expect(article.slug).not_to be_nil
    end
  end

  context 'when call method' do
    it do
      expect(article).to respond_to(:cover_url)
    end
  end
end
