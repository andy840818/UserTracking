class Admins::DashboardController < AdminsController
  def index
    @bookings = Booking.all
  end
end