class Admins::DashboardController < AdminsController
  before_action :authenticate_admin!
  def index
  end
end