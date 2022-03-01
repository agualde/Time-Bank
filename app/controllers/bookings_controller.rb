class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to project_booking
  end

  def update
    @booking = Booking.find(params[:project_id])
    @booking.status = "Approved"
    @booking.save
    redirect_to project_booking
  end

  private

  def booking_params
    params.require(:bookings).permit(:project_id)
  end
end
