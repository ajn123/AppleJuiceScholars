class HomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end

  def about
  end
end
