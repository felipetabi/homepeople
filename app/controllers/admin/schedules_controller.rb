class Admin::SchedulesController < AdminApplicationController

  def index
    user = User.find(params[:user_id])
    @schedules = user.service.schedules
  end

end