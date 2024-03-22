class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :cancel, :restore]

  def index
    @bookings = Booking.all
    track_activity('Visit', 'visit booking page')
  end

  def show
    track_activity('Visit', 'visit booking item')
  end

  def new
    @booking = Booking.new
    track_activity('Visit', 'visit booking detail')
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      track_activity('Submit', 'submit new booking', @booking )
      redirect_to bookings_path, notice:'訂購成功'
    end
  end

  def cancel
    if @booking.update(status: :canceled)
      track_activity('Cancel', 'cancel booking', @booking)
      redirect_to bookings_path, notice: '預訂已取消'
    end
  end

  def restore
    if @booking.update(status: :pending)
      track_activity('Restore', 'restore canceled booking', @booking)
      redirect_to bookings_path, notice: '已恢復預訂'
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status, :content, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end