class Booking < ApplicationRecord
  belongs_to :user
  has_many :activity_trackings
  enum status: { pending: 0, paid: 1, canceled: 2 }
end
