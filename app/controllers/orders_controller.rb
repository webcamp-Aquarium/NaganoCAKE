class OrdersController < ApplicationController
	include CustomersHelper
	def new
		@order = Order.new
	end

	def confirm
		@order = Order.new
		@order.customer_id = current_customer.id
		@order.payment = params[:order][:payment]
		case params[:order][:select]
			when "1"
				@order.postal_code = current_customer.postal_code
				@order.address = current_customer.address
				@order.name = kanji_full_name(current_customer)
			when "2"
				shipping = (params[:order][:shipping]).split(' ')
				@order.postal_code = shipping[0]
				@order.address = shipping[1]
				@order.name = shipping[2]
			when "3"
				@order.postal_code = params[:order][:postal_code]
				@order.address = params[:order][:address]
				@order.name = params[:order][:name]
		end

	end

	def create
	end

	def complete
	end

	def index
	end

	def show
	end

	private

	def order_params
		params.require(:order).permit(:postal_code,:address,:name,:payment,:status,:total_fee,:delivery_fee,:select,:shipping).merge(customer_id: current_customer.id)
	end

	# def shipping_params
	# 	params.require(:shipping).permit(:postal_code,:address,:name)
	# end

end

