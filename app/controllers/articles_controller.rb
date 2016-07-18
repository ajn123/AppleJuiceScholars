class ArticlesController < ApplicationController

  before_filter :check_for_subscription, only: :show

  def index
  end

  def show
    @article = Article.friendly.find(params[:id])
  end


  private


  def check_for_subscription
    unless current_user.subscription.active
      flash[:alert] = "You must be subscribed to access this content"
      redirect_to root_path
    end
  end
end
