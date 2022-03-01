class DashboardsController < ApplicationController
  def index
    @user = current_user
    @projects = Project.where(user_id: @user)
    @bookings = Booking.where(user_id: @user)
    @favorites = Favorite.where(user_id: @user)
  end
end
