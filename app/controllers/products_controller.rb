class ProductsController < ApplicationController
	def index
    @products = Product.all
    @genres = Genre.where(is_status: true)
	end

	def show
    @genres = Genre.where(is_status: true)
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(customer_id: current_customer.id,
                              product_id: params[:id])
	end
end
