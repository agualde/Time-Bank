class UsersController < ApplicationController
  def index
    @users = User.all
    @current_day = Time.now.day
    @current_month = Time.now.month
    @current_year = Time.now.year
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(current_user)
    @user.destroy
    redirect_to root_path
  end
end
