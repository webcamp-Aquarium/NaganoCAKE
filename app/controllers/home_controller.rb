class HomeController < ApplicationController
	def top
		@genres = Genre.where(is_status: true)
    @products = Product.all.sample(4)
	end
end
