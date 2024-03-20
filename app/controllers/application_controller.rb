class ApplicationController < ActionController::Base
  def track_activity(action_type, action_params = nil)
    ActivityTracking.create(
      user: current_user,
      action_type: action_type,
      action_params: action_params,
      timestamp: Time.now
    )
  end
end
