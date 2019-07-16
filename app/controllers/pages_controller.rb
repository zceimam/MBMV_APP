class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def profile
    @user = current_user
  end

  def bookings
    @bookings = current_user.bookings
  end
end
