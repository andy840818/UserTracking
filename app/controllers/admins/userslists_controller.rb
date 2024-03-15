class Admins::UserslistsController < AdminsController

  def index
    @userslists = User.all
  end
  
  def show
    @userslist = User.find(params[:id])
    @latest_bookings = @userslist.bookings.order(created_at: :desc).limit(5)
  end

end
