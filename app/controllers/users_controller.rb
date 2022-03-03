class UsersController < ApplicationController
attr_accessor :user
  def index
    @users = User.all
    @current_day = Time.now.day
    @current_month = Time.now.month
    @current_year = Time.now.year
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save!

    redirect_to edit_skills_path
  end


  def show
    @user = User.find(params[:id])

  end

  def destroy
    @user = User.find(current_user)
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :birthday , :location , :bio , :availability)
  end
end
