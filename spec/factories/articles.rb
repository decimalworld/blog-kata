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
FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    summary { Faker::Lorem.paragraph }
    body { Faker::Lorem.paragraph }
    author factory: %i[user admin]
  end
end
