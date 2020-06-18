class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	
	def create
	    @product = Product.new(product_params)
	    if  @product.save
	    　　flash[:notice] = 'You have created product successfully.'
	        redirect_to admin_products_path
	    else
	        render 'new'
	    end
	end

	def index
	    @products = Product.all
	    @product = Product.new
	end
	
	def edit
	end

	def update
	end
	
	def show
	end

	private
    def product_params
        params.require(:product).permit(:name, :description, :image, :price, :is_status)
    end 	

end
