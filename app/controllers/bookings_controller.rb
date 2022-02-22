class BookingsController < ApplicationController
  def new
    # we need @list in our `simple_form_for`
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking.vehicle = @vehicle
    if @booking.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to vehicle_path(@booking.vehicle)
  end


  private

  def booking_params
    # params.require(:booking).permit(:comment)
    params.require(:booking).permit(:location, :date_start, :date_finish, :user_id)
  end
end
