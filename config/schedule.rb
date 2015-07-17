set :output, "/log/cron_log.log"
every 1.day, at: "4:30 am" do
  rake "admin:delete_request"
end
