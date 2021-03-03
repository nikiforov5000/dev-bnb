class BookingsController < ApplicationController
  before_action :set_developer, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status)
  end

  def set_developer
    @developer = Developer.find(params[:developer_id])
  end
end
