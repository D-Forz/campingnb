class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.camp = @camp
    @review.save
    redirect_to camp_path(@camp)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to camp_path(@camp)
  end

  private

  def set_camp
    @camp = Camp.find(params[:id])
  end
end
