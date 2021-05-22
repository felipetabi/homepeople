class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_bookings = current_user.bookings.includes(schedule: [:service])
  end

  def my_services_booking
    @my_services_booking = current_user.service.schedules.joins(:bookings)
  end

  def create_reserve
    schedules_ids = params[:schedule_ids].split(",")
    schedules_ids.each do |id|
      schedule = Schedule.find(id)
      schedule.update(is_closed: true)
      Booking.create(schedule_id: id, client: current_user, status: 1)
    end
    redirect_to bookings_path, notice: "Haz reservado"
  end

end