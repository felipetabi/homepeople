class ServicesController < ApplicationController
    before_action :authenticate_user!, except: [:show]



    def index
      @categories = Category.all
      @service = current_user.service || current_user.build_service
      @current_user_have_service = Service.find_by_user_id(current_user.id)
      @working_settings = current_user.working_setting || current_user.build_working_setting
      @cities = CS.states(:cl).map{|key, value| [value, key]}
      if !current_user.service.id.nil?
        @comunas = CS.cities(current_user.service.region, :cl)
      else
        @comunas = []
      end
    end

    def show
      @service = Service.find(params[:id])
      @working_settings = @service.user.working_setting
      day = DateTime.now
      @schedules = @service.schedules.left_outer_joins(:booking).where("start_date >= ? and is_closed = false", day).order(:start_date).group(:id).group_by_day(&:start_date)
    end

    def get_cities
      if params[:region]
        comunas = CS.cities(params[:region], :cl)
        render json: comunas.to_json
      end
    end

    def create
      @categories = Category.all
      @service = current_user.service || current_user.build_service
      @service = current_user.build_service(service_params)
      if @service.save
          redirect_to services_path, notice: "Haz creado el servicio"
      else
          render :index, status: :unprocessable_entity
      end
    end


    def update
      @categories = Category.all
      @service = current_user.service || current_user.build_service
      @service = current_user.service
      @cities = CS.states(:cl).map{|key, value| [value, key]}
      if !current_user.service.id.nil?
        @comunas = CS.cities(current_user.service.region, :cl)
      else
        @comunas = []
      end
      if @service.update(service_params)
          redirect_to services_path, notice: "Haz actualizado el servicio"
      else
          render :index, status: :unprocessable_entity
      end
    end

    private

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:description, :region, :comuna, :last_job, :start_date_last_job, :end_date_last_job,
                                      :description_last_job, :address_last_job, categories_last_job:[], category_ids:[], certificates: [])
    end

end
