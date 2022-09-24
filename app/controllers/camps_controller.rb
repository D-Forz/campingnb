class CampsController < ApplicationController
  before_action :set_camp, except: %i[index new create]
  def index
    @camps = Camp.all
  end

  def show; end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(params_camp)
    if @camp.save
      redirect_to camp_path(@camp)
    else
      render :new, status: :unprocesabble_entity
    end
  end

  def edit; end

  def update
    @camp.update(set_camp)
    redirect_to camp_path(@path)
  end

  def destroy
    @camp.destroy
    redirect_to camps_path, status: :see_other
  end

  private

  def set_camp
    @camp = Camp.find(params[:id])
  end

  def params_camp
    params.require(:camp).permit(:title, :content)
  end
end
