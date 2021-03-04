class DashboardsController < ApplicationController
  def show
    @requests = Booking.all.select do |booking|
      booking.developer.owner == current_user
      @requests_accepted = Booking.where(status: 'accepted')
      @requests_pending = Booking.where(status: 'pending')
    end
    @my_bookings_accepted = Booking.where(renter: current_user, status: 'accepted')
    @my_bookings_pending = Booking.where(renter: current_user, status: 'pending')
  end
end
