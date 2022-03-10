class DashboardsController < ApplicationController
  def index
    @user = current_user
    @projects = Project.where(user_id: @user)
    @bookings = Booking.where(user_id: @user)
    @favorites = Favorite.where(user_id: @user)
    @ratings = UserReview.where(user_id: @user.id).map do |review|
      review.review.rating
    end
    @chatroom = Chatroom.all

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/index', locals: { chatrooms: @chatrooms }, formats: [:html] }
    end

  end
end
