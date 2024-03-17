Warden::Manager.before_logout do |user, auth, opts|
  ActivityTracking.create(user: current_user, action_type: 'sign out', timestamp: Time.current)
end