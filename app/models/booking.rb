class Booking < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, paid: 1, cancel: 2 }
end
