class ArticlesController < ApplicationController
  def index
  end

  def show
    @article = Article.friendly.find(params[:id])
  end
end
