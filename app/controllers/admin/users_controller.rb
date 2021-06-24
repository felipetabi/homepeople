class Admin::UsersController < AdminApplicationController
  add_breadcrumb "Users", :admin_users_path
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all.order(created_at: :desc).page params[:page]
  end

  def show
    @bookings = @user.bookings.includes(:chat)
    @services_booking = Booking.includes(:chat).where(service: @user.service)
    @emit_comments = @user.comments.includes( booking: [:service] )
  end

  def edit

  end

  def update

  end

  private

    def set_user
      @user = User.includes(:bookings, :schedules, :service).find(params[:id])
    end
    def user_params
      params.require(:user).permit(:role)
    end


end