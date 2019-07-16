class BookingsController < ApplicationController
  def create
    raise
    @booking = Booking.new(book_para)
    @booking.user = current_user
    @booking.flat = flat_finder

    if @booking.save
      redirect_to flat_path(flat_finder)
    else
      render 'new'
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
    params.require(:booking).permit(:start_date, :end_date)
  end
end
