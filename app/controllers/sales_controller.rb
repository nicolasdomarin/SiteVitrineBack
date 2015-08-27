class SalesController < ApplicationController

	def index 
		@sales = Sale.all
	end

	
  def index
    @sales = Sale.all
  end


  def new
    @sale = Sale.new
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def create

  @sale = Sale.new(sales_params)

  if @sale.save
    redirect_to '/'
  else
    redirect_to '/sales/new'
  end
end


def update
    @sale = Sale.find(params[:id])
    @sale.update!(sales_params)
    redirect_to '/sales/show/'+"#{@sale.id}"
end

 
 
 def destroy
 	@sale = Sale.find(params[:id])
   	if @sale.destroy
   	 redirect_to '/sales'
   	end
  end

  def sales_params
  params.require(:sale).permit(:start_datetime, :end_datetime , :label , :description , :shipping_fees)
end

end
