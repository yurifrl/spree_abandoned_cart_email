class Spree::AbandonedCartEmailConfiguration < Spree::Preferences::Configuration
  preference :email_timeframe, :integer, default: 2.hours
  preference :abandoned_cart_email_active, :boolean, default: false
end
