class Admin::UsersController < AdminApplicationController
  add_breadcrumb "Users", :admin_users_path
  def index
    @users = User.all.order(created_at: :desc).page params[:page]
  end

  def show

  end

  def edit

  end

  def update

  end

  private
    def user_params
      params.require(:user).permit(:role)
    end


end