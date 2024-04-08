# frozen_string_literal: true

class CreateArticleService < ApplicationService
  attr_reader :author_id, :article_params, :cover_extension

  def initialize(author_id:, article_params:, cover_extension: nil)
    @article_params = article_params
    @author_id = author_id
    @cover_extension = cover_extension
    super
  end

  def execute
    ActiveRecord::Base.transaction do
      article = Article.create!({ **article_params, author_id: })
      article.create_cover!(extension: cover_extension)
      article
    end
  end
end
