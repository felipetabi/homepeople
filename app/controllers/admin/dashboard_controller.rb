class Admin::DashboardController < AdminApplicationController
  def index
    @users = User.order(created_at: :desc).last(20)
    @user_register = User.group_by_day(:created_at).count
    @bookings_status = Booking.group(:status).count
    @all_services = Service.count
  end
end
