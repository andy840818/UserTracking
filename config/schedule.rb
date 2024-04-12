# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron.log"

# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end

every 1.day, at: '12:00 am' do
  runner "DailyStatisticJob.perform_later"
end

every 1.day, at: '8:00 am' do
  runner "DailySummaryJob.perform_later"
end

every :monday, at: '12:00 am' do
  runner "WeeklyStatisticJob.perform_later"
end

every :monday, at: '8:00 am' do
  runner "WeeklyStatisticJob.perform_later"
end
# Learn more: http://github.com/javan/whenever
