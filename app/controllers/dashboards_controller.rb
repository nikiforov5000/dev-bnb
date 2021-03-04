class DashboardsController < ApplicationController
  def show
    @requests_accepted = Booking.all.select do |booking|
      booking.developer.owner == current_user && booking.status == "accepted"
    end
    @requests_pending = Booking.all.select do |booking|
      booking.developer.owner == current_user && booking.status == "pending"
    end
    @my_bookings_accepted = Booking.where(renter: current_user, status: 'accepted')
    @my_bookings_pending = Booking.where(renter: current_user, status: 'pending')
  end
end
