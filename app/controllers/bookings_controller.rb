class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.camp = @camp
    @booking.user = @user
    authorize @booking
    if @booking.save
      redirect_to camp_path(@camp), notice: "Successfully created booking."
    else
      @camp = Camp.find(params[:camp_id])
      render 'camps/show', status: :unprocessable_entity
    end
  end

  private

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:camp_id, :user_id, :start_date, :end_date)
  end
end
