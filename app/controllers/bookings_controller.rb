class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :cancel, :restore]

  def index
    @bookings = Booking.all
    first_visit = ActivityTracking.user_activity_exists?(current_user.id, 'Visit', 'first visit booking page')

    if first_visit
      track_activity('Visit', 'visit booking page')
    else
      track_activity('Visit', 'first visit booking page')
    end
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
    @booking.booking_period = calculate_booking_period(current_user)
    p @booking.booking_period 
    if @booking.save
      track_activity('Submit', 'submit booking', @booking )
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
    params.require(:booking).permit(:start_time, :end_time, :status, :content, :user_id, :booking_period)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def calculate_booking_period(user)
    first_visit_time = ActivityTracking.find_by(user: user, action_params: 'first visit booking page').timestamp
    submit_time = Time.now
    (submit_time - first_visit_time).to_i
  end

end