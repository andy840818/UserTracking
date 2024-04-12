class WeeklySummaryJob < ApplicationJob
  queue_as :default

  def perform(*args)

    last_week_statistic = WeeklyStatistic.find_by(end_date: Date.yesterday)

    if last_week_statistic
      
      metrics = {
        active_users: last_week_statistic.active_users,
        booking_number: last_week_statistic.booking_number
      }

      Admin.find_each do |admin|
        SummaryMailer.weekly_summary(admin, metrics).deliver_later
      end
    else
      Rails.logger.info "No statistics available for #{Date.yesterday} - #{Date.yesterday - 6.day}"
    end
  end
end
