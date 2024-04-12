# app/jobs/daily_summary_job.rb
class DailySummaryJob < ApplicationJob
  queue_as :default

  def perform
    yesterday_stats = DailyStatistic.find_by(date: Date.yesterday)

    if yesterday_stats

      metrics = {
        active_users: yesterday_stats.active_users,
        booking_number: yesterday_stats.booking_number,
        average_booking_period: yesterday_stats.average_booking_period,
        percentile_99th_booking_period: yesterday_stats.percentile_99th_booking_period,
        maximum_booking_period: yesterday_stats.maximum_booking_period,
      }

      Admin.find_each do |admin|
        SummaryMailer.daily_summary(admin, metrics).deliver_later
      end
    else
      Rails.logger.info "No statistics available for #{Date.yesterday}"
    end
  end
end
