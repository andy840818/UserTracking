Warden::Manager.before_logout do |user, auth, opts|
  Rails.logger.info "Warden before_logout triggered for user: #{user.inspect}"
  if user
    ActivityTracking.create(user: user, action_type: 'sign out', timestamp: Time.current)
  end
end
