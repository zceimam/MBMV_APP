class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @flats = Flat.all
    @flats_with_address= Flat.where.not(latitude: nil, longitude: nil)

    @markers = @flats_with_address.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def profile
    @user = current_user
  end

  def bookings
    @bookings = current_user.bookings
  end
end
