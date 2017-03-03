require 'minitest/autorun'
require 'stripe'
require_relative 'subscription'

describe Subscription do
  before do
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    
  end
  
  it 'subscribe a customer to gold plan' do
    email = 'bugs_bunny@rubyplus.com'
    stripe_token = Stripe::Token.create(card: { 
                                          number: "4242424242424242",
                                          exp_month:  7,
                                          exp_year:  2020,
                                          cvc: "314"
                                          })
    # This plan must already exist in your Stripe Test account
    plan_id = 'gold'
    
    customer = Subscription.create(email, stripe_token.id, plan_id)
    
    # If there is no exception and the response JSON has the new customer id then the test passes
    assert customer.id.size > 5 
  end
  
  it 'update subscription to a new plan' do
    # This must be an existing customer id who already has a subscription for gold plan
    customer_id = 'cus_9hIOOYk3q1dnBe'
    new_plan_id = 'silver'
    
    subscription = Subscription.update(customer_id, new_plan_id)
    
    assert_equal new_plan_id, subscription.plan.id
  end
  
  it 'can cancel subscription for a subscriber' do
    email = 'daffy@rubyplus.com'
    stripe_token = Stripe::Token.create(card: { 
                                          number: "4242424242424242",
                                          exp_month:  7,
                                          exp_year:  2020,
                                          cvc: "314"
                                          })
    plan_id = 'gold'
    customer = Subscription.create(email, stripe_token.id, plan_id)
    
    subscription = Subscription.cancel(customer.id)
    
    assert_equal 'canceled', subscription.status
  end
end