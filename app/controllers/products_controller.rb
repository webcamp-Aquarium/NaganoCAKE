class ProductsController < ApplicationController
    before_action :valid_genre

    def index
        @products = Product.where(is_status: true)
	end

	def show
        @product = Product.find(params[:id])
      unless @product.is_status
        redirect_to products_path
      end
        @cart_item = CartItem.new
	end

    def search
        @products = Product.where(genre_id: params[:genre_id])
        @genre = Genre.find(params[:genre_id])
    end

    def price
    end

    private

    def valid_genre
        @genres = Genre.where(is_status: true)
    end
end
