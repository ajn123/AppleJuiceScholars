class ArticlesController < ApplicationController

  before_filter :find_article, only: :show

  def index
  end

  def show
    check_for_subscription if @article.premium
  end

  private

  def check_for_subscription
    unless user_signed_in? && current_user.subscription.active
      flash[:alert] = "You must be subscribed to access this content"
      redirect_to root_path
    end
  end

  def find_article
    @article = Article.friendly.find(params[:id])
  end

end
