module Spree
  module AbandonedCartEmailConfig
    Config                 = Spree::AbandonedCartEmailConfiguration.new
    Config.email_timeframe = 2.seconds
  end
end
