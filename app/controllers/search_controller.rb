class SearchController < ApplicationController
	
	def index
		@categories = Category.all
		
		query = {region: params[:region], comuna: params[:comuna], category_id: params[:category_id]}
		@services = Service.where(query)
		@cities = CS.states(:cl)
	end

	def get_cities
		if params[:region]
			comunas = CS.cities(params[:region], :cl)
			render json: comunas.to_json
		end

	end
end