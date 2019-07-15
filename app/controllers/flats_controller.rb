class FlatsController < ApplicationController
  before_action :set_user_id, only: [:show_owned_flats, :show_booked_flats]
  skip_before_action :authenticate_user!

  def index
    @flats = Flat.all
  end

  def show_owned_flats
    @flats = @user.owned_flats
  end

  def show_booked_flats
    @flats = @user.booked_flats
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  private

  def set_user_id
    @user = User.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:description, :address, :price)
  end
end
