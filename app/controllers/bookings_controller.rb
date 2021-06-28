class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_bookings = current_user.bookings
  end

  def my_services_booking
      @my_services_booking = Booking.where(service: current_user.service)
      # redirect_to root_path, alert: "No tienes servicios reservados"
  end

  def create_reserve
    schedules = Schedule.where(id: params[:schedule_ids].split(","))
    service = schedules.first.service
    booking = Booking.create(client: current_user, status: 1, service_id: service.id)
    schedules.each do |schedule|
      schedule.update(is_closed: true)
      BookingSchedule.create(booking: booking, schedule: schedule)
      ActionCable.server.broadcast("user_#{schedule.service.user.id}", { message: "Hola #{ current_user.email }" })
    end
    price = booking.schedules.sum(:price)
    booking.update(price: price)
    booking.create_chat(client_id: booking.client_id, service_client_id: booking.service.user.id)
    redirect_to bookings_path, notice: "Haz reservado"
  end



end