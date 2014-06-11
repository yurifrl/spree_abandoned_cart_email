require 'whenever'
namespace :abandoned_cart do
  desc "Abandoned cart emails"
  task send_emails: :environment do
    Spree::Order.email_eligible_abandoned_email_orders
  end

  desc "Generate Cron"
  task :generate_cron, [:sys_user] => :environment do |t, sys_user|
    yebo_path = File.join(File.expand_path('.'))
    rake_path = File.join('bin', 'rake')
    sh "val=\"* * * * * cd #{yebo_path}; #{rake_path} abandoned_cart:send_emails\";  (crontab -u #{sys_user} -l; echo \"$val\") | crontab -u #{sys_user} -"
  end

  desc "Delete Cron"
  task :delete_cron, [:sys_user] => :environment do |t, sys_user|
    begin
      sh "crontab -u #{sys_user} -r"
    rescue
      # If fall here here, it tried to delete a cron task taht didn't exist
    end
  end
end