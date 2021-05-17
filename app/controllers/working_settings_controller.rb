class WorkingSettingsController < ApplicationController
  before_action :authenticate_user!

  def create
    working_setting = current_user.build_working_setting(working_setting_params)
    if working_setting.save
      redirect_to services_path, notice: "Creaste tus preferencias horarias de trabajo"
    else
      redirect_to services_path, alert: "Hubo un problema #{working_setting.errors.messages.join(', ')}"
    end

  end

  def update
    working_setting = current_user.working_setting

    if working_setting.update(working_setting_params)
      redirect_to services_path, notice: "Actualizaste tus preferencias horarias de trabajo"
    else
      redirect_to services_path, alert: "Hubo un problema #{working_setting.errors.messages.join(', ')}"
    end
  end


  private

  def working_setting_params
    params.require(:working_setting).permit(:hour_price, :end_date, :start_date, array_hours: [], array_days: [])
  end

end