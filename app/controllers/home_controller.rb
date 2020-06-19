class HomeController < ApplicationController
	def top
		@genres = Genre.where(is_status: true)
	end
end
