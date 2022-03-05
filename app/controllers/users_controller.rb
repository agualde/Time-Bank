class UsersController < ApplicationController
attr_accessor :user
skip_before_action :authenticate_user!, only: [:index, :show]
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

    if user_signed_in?
      @my_projects_together = current_user.bookings.where(user_id: params[:id])
      @my_projects_together_2 = current_user.projects
      @her_projects_together = @user.projects

      @our_projects = []

      @my_projects_together.each do |booking|
        @our_projects << booking.project.title
      end

      @her_projects_together.each do |project|
        @our_projects << project.title if project.bookings.where(user_id: current_user.id, status: "Approved")
      end

      @my_projects_together_2.each do |project|
        @our_projects << project.title if project.bookings.where(user_id: @user.id, status: "Approved")
      end
    end
  end

  def destroy
    @user = User.find(current_user)
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :birthday , :location , :bio , :availability, :photo)
  end
end
