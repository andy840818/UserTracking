class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all 
  end

  def new
    @booking = Booking.new
    unless session[:booking_id]
      @booking = Booking.create(start_time: Time.now)
      session[:booking] = @booking
    end
  end

  def create
    @booking = Booking.new(booking_params)
    p @booking
    @booking.end_time = Time.now
    if @booking.save
      redirect_to root_path, notice:'訂購成功'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status, :content, :user_id)
  end

end