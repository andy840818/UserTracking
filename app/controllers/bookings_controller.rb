class BookingsController < ApplicationController
  def index
    @bookings = Booking.all 
  end

  def new
    @booking = Booking.new
    @booking.start_time = Time.current
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.end_time = Time.current
    if @booking.save
      redirect_to root_path, notice:'訂購成功'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status, :content, :user_id)
  end

end