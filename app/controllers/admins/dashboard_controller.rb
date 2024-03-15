class Admins::DashboardController < AdminsController
  def index
    @daily_bookings_count = Booking.group("DATE(start_time)").count
    @weekly_bookings_count = Booking.group("EXTRACT(YEAR FROM start_time)", "EXTRACT(MONTH FROM start_time)", "EXTRACT(WEEK FROM start_time)")
                                    .count
    @bookings = Booking.all
  end
end