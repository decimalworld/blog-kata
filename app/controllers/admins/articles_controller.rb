# frozen_string_literal: true

module Admins
  class ArticlesController < ApplicationController
    def create
      article = CreateArticleService.execute(author_id: current_admin.id, article_params:, cover_extension: cover_extension[:cover_extension])
      response_with_serializer(article, { full_serializer: false })
    end

    private

    def article_params
      params.require(:article).permit(:title, :body, :summary)
    end

    def cover_extension
      params.require(:article).permit(:cover_extension)
    end
  end
end
