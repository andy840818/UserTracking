class ActivityTracking < ApplicationRecord
  belongs_to :user
  belongs_to :booking, optional: true
  validate :valid_action_type

  VALID_ACTION_TYPES = [
    'Visit',
    'Login',
    'Logout',
    'Sign_up',
    'Reset_password',
    'Submit',
    'Cancel',
    'Restore'
   ].freeze

  private

  def valid_action_type
    errors.add(:action_type, 'is not valid') unless VALID_ACTION_TYPES.include?(action_type)
  end
  
  def self.user_activity_exists?(user_id, action, action_params)
    where(user_id: user_id, action_type: action, action_params: action_params).exists?
  end

end
