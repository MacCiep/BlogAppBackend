class FavouriteArticlesController < ApplicationController

  def create
    @favourite_article = current_user.favourite_articles.new(favourite_article_params)
    if @favourite_article.save
      render(json: @favourite_article, status: :ok)
    else
      render(json: @favourite_article.erros.full_messages, status: :bad_request)
    end

  end

  def index
    render(json: FavouriteArticlesSerializer.new(current_user.favourite_articles).serialized_json, status: :ok)
  end

  def favourite_article_params
    params.require(:favourite_article).permit(:article_id)
  end
end
