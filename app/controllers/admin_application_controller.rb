class AdminApplicationController < ActionController::Base
  layout 'admin_application'
  before_action :authenticate_user!, :is_admin?
  add_breadcrumb "Dashboard", :admin_root_path

  def is_admin?
    if !current_user.admin?
      redirect_to services_path, alert: "No tienes accesos para entrar acá :P"
    end
  end

end