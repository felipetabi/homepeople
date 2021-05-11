class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?
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
