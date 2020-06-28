class HomeController < ApplicationController
	def top
		@genres = Genre.where(is_status: true)
    @products = Product.where(is_status: true,genre_id: @genres).sample(3)
	end
end
