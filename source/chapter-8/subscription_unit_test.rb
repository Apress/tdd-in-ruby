require 'minitest/autorun'
require 'stripe'
require_relative 'subscription'

describe Subscription do

  it 'subscribe customer to a plan' do
    email = 'bugs.bunny@rubyplus.com'
    plan_id = 'gold' 
    stripe_token = 'value does not matter'
    
    hash = JSON.parse(File.read("fixtures/customer.json"))
    customer = Stripe::Customer.construct_from(hash)      
    
    Stripe::Customer.stub :create, customer do
      customer = Subscription.create(email, stripe_token, plan_id)
      
      assert_equal 'cus_6XToBT4GczhYXA', customer.id
      assert_equal 'gold', customer.subscriptions.data[0].plan.id
    end
  end
  
  it 'update subscription will update an existing subscribed plan' do
    existing_customer_id = 'cus_6XToBT4GczhYXA' 
    new_plan_id = 'silver' 

    hash = JSON.parse(File.read("fixtures/customer.json"))
    customer = Stripe::Customer.construct_from(hash)      
    
    subscription_hash = JSON.parse(File.read("fixtures/subscription.json"))
    subscription = Stripe::Subscription.construct_from(subscription_hash)
    
    Stripe::Customer.stub :retrieve, customer do
      customer.stub :update_subscription, subscription do
        result_subscription = Subscription.update(existing_customer_id, new_plan_id)
      
        assert_equal 'silver', result_subscription.plan.id       
        assert_equal 'active', result_subscription.status
      end
    end    
  end
  
  it 'cancel subscription will return subscription object with cancelled status' do
    existing_customer_id = 'cus_6XToBT4GczhYXA'

    customer_hash = JSON.parse(File.read("fixtures/customer.json"))
    customer = Stripe::Customer.construct_from(customer_hash)

    cancelled_subscription_hash = JSON.parse(File.read("fixtures/cancelled_subscription.json"))
    subscription = Stripe::Subscription.construct_from(cancelled_subscription_hash)

    Stripe::Customer.stub :retrieve, customer do
      customer.stub :cancel_subscription, subscription do
        result = Subscription.cancel(existing_customer_id)

        assert_equal 'canceled', result.status
      end
    end
  end
  
  it 'raises SocketError when there is no Internet connectivity' do
    raises_exception = ->(a, b){ raise SocketError.new }
    Net::HTTP.stub :get, raises_exception do
      assert_raises SocketError do
        Subscription.cancel('bogus customer id')  
      end      
    end
  end
end