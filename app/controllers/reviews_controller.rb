class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[create destroy]
  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to camp_path(@booking.camp), notice: "Successfully created review."
    else
      render 'bookings/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to camp_path(@booking.camp), notice: "Successfully deleted review."
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
