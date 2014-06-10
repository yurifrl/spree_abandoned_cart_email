class Spree::AbandonedCartEmailConfiguration < Spree::Preferences::Configuration
  preference :email_timeframe, :integer, default: 12.hours
  preference :abandoned_cart_email_active, :boolean, default: false
end
