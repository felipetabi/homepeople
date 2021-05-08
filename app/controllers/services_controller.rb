class ServicesController < ApplicationController
    before_action :authenticate_user!

    

    def index
        @categories = Category.all
        @service = current_user.service || current_user.build_service
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
        if current_user.role == 0
            current_user.update(role: 1)
        end
    end
    

    def update
        @categories = Category.all
        @service = current_user.service || current_user.build_service
        @service = current_user.service
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
        params.require(:service).permit(:title, :description, :region, :comuna, :category_id, certificates: [])
    end
end
