class BookingsController < ApplicationController
  before_action :set_developer, only: [:new, :create]
  before_action :set_booking, only: :show

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    @booking.developer = @developer
    @booking.total_price = ((@booking.end_date - @booking.start_date).to_i + 1) * @developer.daily_rate
    @booking.status = "Confirmed"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show; end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :project_name)
  end

  def set_developer
    @developer = Developer.find(params[:developer_id])
  end
end
