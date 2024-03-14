class Booking < ApplicationRecord
  belongs_to :user

  def duration
    if end_time.present?
      (end_time - start_time).to_i
    end
  end

  def booking_period
    if duration.present?
      seconds = duration
      hours = seconds / 3600
      minutes = (seconds % 3600) / 60
      "#{hours}:#{minutes}:#{seconds}"
    end
  end
end
