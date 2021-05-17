class SearchController < ApplicationController
	
	def index
		@categories = Category.all
		
		query = {region: params[:region], comuna: params[:comuna], category_id: params[:category_id]}
		@services = Service.where(query)
		

		
	end


end