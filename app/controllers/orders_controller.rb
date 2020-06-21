class OrdersController < ApplicationController
	include CustomersHelper
	include CartItemsHelper
	include ProductsHelper

	def new
		@order = Order.new
	end

	def confirm
		@cart_items = CartItem.where(customer_id: current_customer.id)

		@order = Order.new
		@order.payment = params[:order][:payment]
		@order.total_fee = total_fee(@cart_items)
		@order.customer_id = current_customer.id
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
		@cart_items = CartItem.where(customer_id: current_customer.id)

		@order = Order.new(order_params)
		@order.total_fee = total_fee(@cart_items)

		if @order.save
			@cart_items.each do |ci|
				@order_detail = OrderDetail.new(order_id: @order.id,
																	product_id: ci.product.id,
																		price: ci.product.price,
																					number: ci.number)
				@order_detail.save
			end
			@cart_items.destroy_all
			redirect_to orders_complete_path
		else
			redirect_back(fallback_location: products_path)
		end
	end

	def complete
	end

	def index
	end

	def show
	end

	private
	def order_params
		params.require(:order).permit(:postal_code, :address, :name, :payment).merge(customer_id: current_customer.id)
	end
end

