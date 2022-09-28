class ReviewsController < ApplicationController
  before_action :set_camp, only: %i[create destroy]
  def create
    @review = Review.new(review_params)
    @review.camp = @camp
    authorize @review
    if @review.save
      redirect_to camp_path(@camp), notice: "Successfully created review."
    else
      render 'camps/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to camp_path(@camp), notice: "Successfully deleted review."
  end

  private

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
