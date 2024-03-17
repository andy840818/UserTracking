class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all
    ActivityTracking.create(user: current_user, action_type: 'Visit', action_params: 'visit home page', timestamp: Time.now)
  end

  def new
    @booking = Booking.new
    current_user&.record_first_activity!('Visit', 'first visit booking page')
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