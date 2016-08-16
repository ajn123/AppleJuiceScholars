require "stripe"
if Rails.env.production?
  Stripe.api_key = ENV['STRIPE_API_KEY']
else
  Stripe.api_key = ENV['STRIPE_TEST_SECRET']
end
