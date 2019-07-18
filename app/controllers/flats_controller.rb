class FlatsController < ApplicationController
  before_action :set_user_id, only: [:show_owned_flats, :show_booked_flats]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def call_map
   @flats = Flat.where.not(latitude: nil, longitude: nil)

     @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
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
    current_user.owner = true
    current_user.save
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_user_id
    @user = User.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:description, :address, :price, :photo)
  end
end
