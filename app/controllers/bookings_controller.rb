class BookingsController < ApplicationController
  before_action :set_camp, only: %i[new create show]
  before_action :set_booking, only: %i[show destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def show
    @review = Review.new
    authorize @booking
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to camp_path(@booking.camp), notice: "Successfully deleted booking."
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.camp = @camp
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to camp_booking_path(@camp, @booking), notice: "Successfully created booking."
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
