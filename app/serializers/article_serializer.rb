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
class ArticleSerializer < ActiveModel::Serializer
  attributes  :id, :title, :cover_url, :summary, :slug, :author_name
  attribute   :body, if: -> { instance_options[:full_serializer] == true }
  attributes  :created_at, :updated_at

  def cover_url
    object.cover_presigned_url ? object.cover_presigned_url : object.cover_url
  end
end
