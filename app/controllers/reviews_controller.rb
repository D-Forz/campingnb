class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to camp_path(@camp)
    else
      @camp = Camp.find(params[:camp_id])
      render 'camps/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to camp_path(@camp)
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
