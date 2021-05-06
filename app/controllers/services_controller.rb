class ServicesController < ApplicationController
    def index
    end

    def new
        #session[:intentos] = session[:intentos] ? session[:Intentos] + 1 : 1
       # @photo = Photo.new
    end
    def create
        filtered_params = params.require(certificates:[]).permit(:title, :description, :region)
    end

    private
    def service_params
        params.require(:service).permit(certificates: [])
        
    end
end
