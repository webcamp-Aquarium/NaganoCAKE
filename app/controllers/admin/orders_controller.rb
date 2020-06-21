class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
		@order = Order.new(order_params)
	end
	
	def show
		@order = Order.find(params[:id])
	end

	private
    def order_params
        params.permit(:status,:payment,:postal_code,:address,:name,:total_fee,:delivary_fee,:order_details_id,:customer_id)
    end     

end
