class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def edit
        @category = Category.find(params[:id])
    end

    def create
        @category = Category.new(categories_params)
        if @category.save
            redirect_to categories_url, notice: "Haz creado una categoría"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @category = Category.find(params[:id])

        if @category.update(categories_params)
            redirect_to categories_url, notice: "Haz actualizado una categoría"
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path, notice: "Haz eliminado una categoria"
    end
    

    private

    def categories_params
        params.require(:category).permit(:name)
    end

end
