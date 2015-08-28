class ProductsController < ApplicationController
before_action :require_user
	def index 
		@products = Product.all
	end

	def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end


def create
     
    @product = Product.new(products_params)

    if @product.save

      redirect_to '/products'
    else
      redirect_to '/products/new'
    end
  end



  def update
      @product = Product.find(params[:id])
    @product.update!(products_params)
      redirect_to '/products/show/'+"#{@product.id}"
  end
    
  def products_params
      params.require(:product).permit(:label, :price, :description , :category_id ,:sale_id ,:special_price, :stock ,:image)
  end


 
 
 def destroy
 	@product = Product.find(params[:id])
   	if @product.destroy
   	 redirect_to '/products'
   	end
  end
end
