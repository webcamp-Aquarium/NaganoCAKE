class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	
	def create
	    @product = Product.new(product_params)
	   if   @product.save
	   	    flash[:notice] = "商品情報が登録されました。"
	        redirect_to admin_products_path
	   else
	        render 'new'
	   end     
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
	   if  @product.update(product_params)
	   	   flash[:notice] = "商品情報が更新されました。"
	       redirect_to admin_product_path
	   else
	       render 'edit'
	   end       
	end
	
	def show
		@product = Product.find(params[:id])
	end

	private
    def product_params
        params.require(:product).permit(:name, :description, :image, :price, :is_status, :genre_id)
    end 	

end
