class ActivityTracking < ApplicationRecord
  belongs_to :user
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
end
