class BookingsController < ApplicationController
  def create
    @booking = Booking.new(book_para)
    @booking.user = current_user
    @booking.flat = Flat.find(params[:flat_id])

    if @booking.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  def new
    @booking = Booking.new
  end

  def destroy
  end

  private

  def book_para
    params.require(:booking).permit(:start_date, :end_date)
  end
end
