class WeeklyStatisticJob < ApplicationJob
  queue_as :default

  def perform(*args)
    end_date = Date.today.beginning_of_week(:monday) - 1.day
    start_date = end_date - 6.days

    active_users = User.where(last_active_at: start_date..end_date).distinct.count
    booking_number = Booking.where(created_at: start_date..end_date).count
    week_of_month = calculate_week_of_month(start_date)

    WeeklyStatistic.create(
      start_date: start_date,
      end_date: end_date,
      active_users: active_users,
      booking_number: booking_number
    )
  end

  private

  def calculate_week_of_month(date)
    beginning_of_month = date.beginning_of_month
    ((date - beginning_of_month).to_i / 7) + 1
  end
end
