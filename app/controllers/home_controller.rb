class HomeController < ApplicationController
  def index
    @articles = Article.all.order('published_at DESC').paginate(:page => params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def about
  end
end
