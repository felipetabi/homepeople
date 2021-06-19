class SearchController < ApplicationController

	def index
		@categories = Category.all
		query = {region: params[:region], comuna: params[:comuna]}
		@services = Service.joins(:categories, user: [:working_setting]).where(query).where(categories: {id: params[:category_ids]}).distinct

		if params[:start_date]
			start_date = params[:start_date].to_date
			end_date = params[:end_date].empty? ? DateTime.now+7.days : params[:end_date].to_date
			range_dates = params[:start_date]..params[:start_date]
			@services.joins(:schedules).where(schedules: {is_closed: false, start_date: start_date..end_date })
		end
		
		@cities = CS.states(:cl).map{|key, value| [value, key]}
	end
	

	def get_cities
		if params[:region]
			comunas = CS.cities(params[:region], :cl)
			render json: comunas.to_json
		end

	end
end