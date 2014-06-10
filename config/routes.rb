Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :abandoned_cart_email
  end
end