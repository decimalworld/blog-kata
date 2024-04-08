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
class Article < ApplicationRecord
  belongs_to :author, class_name: 'Users::Admin'
  has_one :cover, as: :imageable, class_name: 'Image', dependent: :destroy

  validates :title, presence: true
  validates :summary, presence: true
  validates :body, presence: true

  after_save :create_slug, if: :id_previously_changed?

  delegate :url, to: :cover, prefix: true, allow_nil: true
  delegate :presigned_url, to: :cover, prefix: true, allow_nil: true

  def author_name
    author.username
  end

  private

  def create_slug
    slug = "#{ActiveSupport::Inflector.transliterate(title).slice(0, 15).gsub(/\s/, '-')}-#{id}".downcase
    update!(slug:)
  end
end
