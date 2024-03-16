class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    ActivityTracking.create(user: resource, action_type: 'login', timestamp: Time.now)
    root_path
  end
end
