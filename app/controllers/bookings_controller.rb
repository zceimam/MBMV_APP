class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
  end

  def create
    @booking = Booking.new(book_para)
    @booking.user = current_user
    @booking.flat = flat_finder

  respond_to do |format|
    if @booking.save
      format.html  { redirect_to bookings_path, notice: 'Thank You For Your Booking' }
      format.json  { render json: Booking.create(book_para) }
    else
      @booking = Booking.new
      format.html  { render "flats/show" }
      format.json  { render :json => @booking.errors, :status => :unprocessable_entity }
    end
  end
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def destroy
  end

  private

  def flat_finder
    Flat.find(params[:flat_id])
  end

  def book_para
    params.require(:booking).permit(:start_date, :end_date, :number, :message)
  end
end
