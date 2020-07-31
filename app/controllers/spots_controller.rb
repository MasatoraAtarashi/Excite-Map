class SpotsController < ApplicationController
  before_action :logged_in_user, only: %i[index show new create destroy]
  before_action :admin_user, only: :destroy

  def index
    @spots = Spot.all
  end

  def show
  end

  def new
    @spot = current_user.spots.build
  end

  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def destroy
    Spot.find_by(id: params[:id]).destroy
    redirect_to admin_path
  end

  private
  def spot_params
    params.require(:spot).permit(:id, :title, :description, :mood, :picture, :latitude, :longitude)
  end
end
