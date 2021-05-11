class CategoriesController < ApplicationController
    before_action :authenticate_user! do 
        if current_user.role != 2
            redirect_to services_path
        end
    end
      

    def index
        
        @category = current_user.category || current_user.build_category
    end

    def create
       
        @category = current_user.category || current_user.build_category
        @category = current_user.build_category(category_params)
    end
end
