class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @project = Project.find(params[:project_id])
    @booking.project_id = @project.id
    @booking.user_id = current_user.id
    @booking.save
    redirect_to project_path(@project.id)
  end

  def update
   @booking = Booking.find(params[:project_id])
   @booking.status = "Approved"
   @booking.save
   redirect_to project_booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @project = @booking.project_id
    @booking.destroy
    redirect_to project_path(@project)
  end
end
