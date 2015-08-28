class CategoriesController < ApplicationController
	
  before_action :require_user

  def index 
     @categories = Category.all
	end

	 def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

 
 
 def destroy
 	@category = Category.find(params[:id])
   	if @category.destroy
   	 redirect_to '/categories'
   	end
  end
end
