class ProductsController < ApplicationController
    before_action :valid_genre

    def index
        @products = Product.where(is_status: true,genre_id: @genres)
	end

	def show
        @product = Product.find(params[:id])
      unless @product.is_status == '販売中' && @product.genre.is_status == '有効'
        redirect_to products_path
      end
        @cart_item = CartItem.new
	end

    def search
        @genre = Genre.find(params[:genre_id])
        if @genre.is_status == '有効'
            @products = Product.where(genre_id: params[:genre_id])
        else
            redirect_to products_path
        end
    end

    def price
    end

    private

    def valid_genre
        @genres = Genre.where(is_status: true)
    end
end
