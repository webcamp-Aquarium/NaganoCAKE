class ProductsController < ApplicationController
	def index
    @products = Product.where(is_status: true)
    @genres = Genre.where(is_status: true)
	end

	def show
    @genres = Genre.where(is_status: true)
    @product = Product.find(params[:id])
    unless @product.is_status
      redirect_to products_path
    end
    @cart_item = CartItem.new(customer_id: current_customer.id,
                              product_id: params[:id])
	end
end
