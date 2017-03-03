class Subscription
  def self.create(email, stripe_token, plan_id, description='none')
    Stripe::Customer.create(email:       email,
                            description: description,
                            card:        stripe_token,
                            plan:        plan_id)
  end
  
  def self.update(customer_id, plan_id)
    customer = Stripe::Customer.retrieve(customer_id)
    customer.update_subscription(plan: plan_id)
  end
  
  def self.cancel(customer_id)
    check_internet_connectivity
    customer = Stripe::Customer.retrieve(customer_id) 
    customer.cancel_subscription
  end
  
  def self.check_internet_connectivity
    require 'net/http'
    begin
      Net::HTTP.get('example.com', '/index.html')
    rescue SocketError => se
      message = "Problem with Internet connection. Check your Internet and try again"
      raise se, message
    end
  end
end