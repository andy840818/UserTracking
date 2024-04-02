class DailyStatistic < ApplicationRecord
  validates :date, presence: true, uniqueness: true

  def self.booking_period(user_id)
    first_visit = ActivityTracking.find_by(user_id: user_id, action_type: 'first visit booking page')
    booking_submit = ActivityTracking.find_by(user_id: user_id, action_type: 'submit booking')

    return nil if first_visit.nil? || booking_submit.nil?

    booking_submit.timestamp - first_visit.timestamp
  end
end
