class CampsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_camp, except: %i[index new create]
  def index
    @camps = policy_scope(Camp)
  end

  def show
    @review = Review.new
  end

  def new
    @camp = Camp.new
    authorize @camp
  end

  def create
    @camp = Camp.new(params_camp)
    @camp.user = current_user
    authorize @camp
    if @camp.save
      redirect_to camp_path(@camp), notice: "Successfully created camp."
    else
      render :new, status: :unprocesabble_entity
    end
  end

  def edit
  end

  def update
    @camp.update(params_camp)
    redirect_to camp_path(@camp)
  end

  def destroy
    @camp.destroy
    redirect_to camps_path, status: :see_other
  end

  private

  def set_camp
    @camp = Camp.find(params[:id])
    authorize @camp
  end

  def params_camp
    params.require(:camp).permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :location,
      :price,
      :capacity,
      photos: []
    )
  end
end
