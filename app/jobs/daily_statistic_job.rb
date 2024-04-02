class DailyStatisticJob < ApplicationJob
  queue_as :default

  def perform(*args)
    date = Date.yesterday
    active_users = User.where('last_active_at >= ?', 1.day.ago).count
    booking_number = bookings_on_date(date).count
    average_booking_period = calculate_average_booking_period(date)
    percentile_99th_booking_period = calculate_99th_percentile_for_date(date)
    maximum_booking_period = calculate_maximum_booking_period(date)

    DailyStatistic.create(
      date: date,
      active_users: active_users,
      booking_number: booking_number,
      average_booking_period: average_booking_period,
      percentile_99th_booking_period: percentile_99th_booking_period,
      maximum_booking_period: maximum_booking_period
    )
  end

  private

  def bookings_on_date(date)
    Booking.where("DATE(created_at) = ?", date)
  end

  def calculate_average_booking_period(date)
    total_period = bookings_on_date(date).sum(:booking_period)
    total_bookings = bookings_on_date(date).count
  
    if total_bookings > 0
      (total_period.to_f / total_bookings)
    else
      0
    end
  end

  def calculate_99th_percentile_for_date(date)
    bookings = bookings_on_date(date)
    return nil if bookings.empty?
  
    sorted_periods = bookings.pluck(:booking_period).sort
    percentile_index = (0.99 * sorted_periods.length).ceil - 1
    percentile_index = [percentile_index, 0].max
    
    sorted_periods[percentile_index]
  end  

  def calculate_maximum_booking_period(date)
    bookings_on_date(date).maximum(:booking_period)
  end

end
