module Spree
  module AbandonedCartEmailConfig
    Config                             = Spree::AbandonedCartEmailConfiguration.new
    Config.email_timeframe             = 12.hours
    Config.abandoned_cart_email_active = false
  end
end
