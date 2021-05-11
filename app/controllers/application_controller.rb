class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_admin?
    if current_user.role != 2
      redirect_to services_path, alert: "No tienes accesos para entrar acá :P"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :birthday, :address, :role, :region, :comuna, :description, :photo])
  end
end
