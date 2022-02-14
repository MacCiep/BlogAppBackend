class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :delete, :update]

  def index
    options = {
      include: [:user]
    }
    @articles = ArticlesSerializer.new(Article.includes(:user).page(params[:page]), options)
    render(json: {records: @articles, meta: {total_pages: Article.page(1).total_pages}}, status: :ok)
  end

  def show
    render(json: ArticlesSerializer.new(@article).serialized_json, status: :ok)
  end

  def create
    # @article = Article.new(articles_params)
    @article = current_user.articles.new(articles_params)
    if @article.save
      render(status: :ok)
    else
      render(json: @article.errors.full_messages, status: :bad_request)
    end
  end

  def update
    if @article.update(articles_params)
      render(status: ok)
    else
      render(json: @article.errors.full_messages, status: :bad_request)
    end
  end

  def delete
    if Article.delete(@article)
      render(status: :ok)
    else
      render(json: @article.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def articles_params
    params.require(:article).permit(:title, :content, :visible)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end