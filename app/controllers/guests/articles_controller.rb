# frozen_string_literal: true

module Guests
  class ArticlesController < ApplicationController
    def index
      articles = Article.paginate_with(**pagination_params)
      response_with_pagination(articles)
    end

    def show
      article = Article.find_by!(slug: params[:id])
      response_with_serializer(article, { full_serializer: true })
    end
  end
end
