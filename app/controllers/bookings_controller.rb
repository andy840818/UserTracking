class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all 
  end

  def new
    @booking = Booking.new
    ActivityTracking.create(user: current_user, action_type: 'Booking', action_params: 'first visit booking page', timestamp: Time.now)
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      ActivityTracking.create(user: current_user, action_type: 'Booking', action_params: 'submit new booking', timestamp: Time.now)
      redirect_to root_path, notice:'訂購成功'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status, :content, :user_id)
  end

end