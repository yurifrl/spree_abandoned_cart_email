require 'whenever'
namespace :abandoned_cart do
  desc "Abandoned cart emails"
  task send_emails: :environment do
    Spree::Order.email_eligible_abandoned_email_orders
  end

  desc "Generate Cron"
  task generate_cron: :environment do
    yebo_path    = File.join(File.expand_path('.'))
    rake_path    = File.join('bin', 'rake')
    current_user = 'yuri'
    comand       = "val=\"* * * * * cd #{yebo_path}; #{rake_path} abandoned_cart:send_emails\";  (crontab -u #{current_user} -l; echo \"$val\") | crontab -u #{current_user} -"
    sh comand
  end

  desc "Delete Cron"
  task delete_cron: :environment do
    current_user = 'yuri'
    command      = "crontab -u #{current_user} -r"

    begin
      sh command
    rescue
      #
    end
  end
end