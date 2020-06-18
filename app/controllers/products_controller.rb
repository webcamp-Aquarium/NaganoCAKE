class ProductsController < ApplicationController
	def index
    @products = Product.all
    @genres = Genre.where(is_status: true)
	end
	
	def show
	end	
end
