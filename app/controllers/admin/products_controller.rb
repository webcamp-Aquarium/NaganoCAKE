class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	
	def create
	    @product = Product.new(product_params)
	    @product.save
	    redirect_to admin_products_path
	end

	def index
	    @products = Product.all
	    @product = Product.new
	    @genres = Genre.all
	end
	
	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
	    @product.update(product_params)
	    redirect_to admin_product_path(@product)
	end
	
	def show
		@product = Product.find(params[:id])
	end

	private
    def product_params
        params.require(:product).permit(:name, :description, :image, :price, :is_status, :genre_id)
    end 	

end
