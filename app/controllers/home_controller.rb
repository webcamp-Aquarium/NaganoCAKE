class HomeController < ApplicationController
	def top
		@genres = Genre.where(is_status: true)
    @products = Product.all.sample(3)
	end
end
