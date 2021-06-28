class Admin::ServicesController < AdminApplicationController
  before_action :set_service, only: [:show, :edit, :update]
  def index
    @services = Service.all
  end

  def show
  end

  def edit
  end

  def update
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