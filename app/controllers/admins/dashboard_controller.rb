class Admins::DashboardController < AdminsController
  before_action :authenticate_admin!
  def index
     # 每日人数
    @daily_bookings_count = Booking.group("DATE(start_time)").count
  # 每周人数，这里假设 start_time 是 UTC 时间
    @weekly_bookings_count = Booking.group("EXTRACT(YEAR FROM start_time)", "EXTRACT(MONTH FROM start_time)", "EXTRACT(WEEK FROM start_time)")
                                    .count
    @bookings = Booking.all
  end
end