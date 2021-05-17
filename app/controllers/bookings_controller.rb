class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_bookings = current_user.bookings.includes(schedule: [:service])
  end

  def my_services_booking
    @my_services_booking = current_user.service.schedules.joins(:bookings)
  end
  

end