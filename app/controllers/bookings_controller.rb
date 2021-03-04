require 'date'

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
    @booking.status = "pending"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @show_review_button_renter = @booking.status == "accepted" && current_user == @booking.renter && @booking.start_date < Date.today
    @show_review_button_owner = @booking.status == "accepted" && current_user == @booking.developer.owner && @booking.start_date < Date.today
  end

  def update
    @booking = Booking.find(params[:id])
      if @booking.update_attributes(booking_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @booking
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :project_name, :status)
  end

  def set_developer
    @developer = Developer.find(params[:developer_id])
  end
end
