class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @project = Project.find(params[:project_id])
    @booking.project_id = @project.id
    @booking.user_id = current_user.id
    @booking.save
    redirect_to project_path(@project.id)
  end

  def show
    @booking = Booking.find(params[:id])
    @current_day = Time.now.day
    @current_month = Time.now.month
    @current_year = Time.now.year
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "Approved"
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @project_id = @booking.project_id
    @booking.destroy

    redirect_to project_path(@project_id)
  end

  def destroy_from_dashboard
    @booking = Booking.find(params[:id])
    @project_id = @booking.project_id
    @booking.destroy

    redirect_to dashboard_path
  end


end
