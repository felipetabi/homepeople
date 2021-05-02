class ServicesController < ApplicationController
    def index
    end
    private
    def service_params
        params.require(:service).permit(certificates: [])
        
    end
end
