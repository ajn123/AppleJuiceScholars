class UsersController < ApplicationController
  before_filter :authenticate_user!

  def info
    @subscription = current_user.subscription

    if @subscription.active
      @stripe_customer = Stripe::Customer.retrieve(@subscription.stripe_user_id)
      @stripe_subscription = @stripe_customer.subscriptions.first
    end
  end

  def charge
    token = params['stripeToken']
    begin
      customer = Stripe::Customer.create(
        source: token,
        plan: ENV['STRIPE_PLAN_ID'],
        email: current_user.email,
      )
    rescue
      flash[:alert] = "Your card was declined. Please try again."
      redirect_to users_info_path
    else
      current_user.subscription.stripe_user_id = customer.id
      current_user.subscription.active = true 
      current_user.subscription.save

      redirect_to users_info_path
    end

  end

  def cancel_subscription
    @subscription = current_user.subscription
    @stripe_customer = Stripe::Customer.retrieve(@subscription.stripe_user_id)
    @stripe_subscription = @stripe_customer.subscriptions.first

    @stripe_subscription.delete(at_period_end: true) 
    current_user.subscription.active = false
    current_user.subscription.save

    flash[:alert] = "You have canceled your subscription!"

    redirect_to users_info_path
  end

end
