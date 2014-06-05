set :output, "#{path}/log/cron.log"

every 2.minutes do
  rake "abandoned_cart:send_emails"
  command "echo #{Time.now} && 1 > ~/hello.txt"
end