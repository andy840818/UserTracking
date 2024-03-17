class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :activity_trackings

  validates :name, presence: true, uniqueness: true

  def record_first_activity!(type, params)
    unless ActivityTracking.exists?(user: self, action_type: type, action_params: params)
      ActivityTracking.create(user: self, action_type: type, action_params: params, timestamp: Time.current)
    end
  end

end
