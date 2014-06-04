namespace :abandoned_cart do
  desc "Abandoned cart emails"
  task send_emails: :environment do
    Spree::Order.self.email_eligible_abandoned_email_orders
  end
end

