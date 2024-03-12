class Booking < ApplicationRecord
  belongs_to :user

  def duration
    (end_time - start_time).to_i
  end

  def booking_period
    seconds = duration
    hours = seconds / 3600
    minutes = (seconds % 3600) / 60
    "#{hours}:#{minutes}:#{seconds}"
  end
end
