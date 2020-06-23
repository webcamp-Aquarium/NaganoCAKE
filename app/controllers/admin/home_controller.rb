class Admin::HomeController < ApplicationController
	before_action :authenticate_admin_administrator!
	def top
	end
		
end
