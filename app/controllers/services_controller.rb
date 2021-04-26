class ServicesController < ApplicationController
    def index
    end
    def service_params
        params.require(:service).permit(certificates: [])
        
    end
end
