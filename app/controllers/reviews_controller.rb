class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking

  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
