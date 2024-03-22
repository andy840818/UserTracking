class Booking < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, paid: 1, canceled: 2 }
end
