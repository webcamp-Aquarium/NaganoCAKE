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
		@order.select = params[:order][:select]
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

		if @order.invalid?
			render :new
		end
	end

	def create
		@cart_items = CartItem.where(customer_id: current_customer.id)

		@order = Order.new(order_params)
		@order.total_fee = total_fee(@cart_items)
		if @order.save
			@cart_items.each do |ci|
				OrderDetail.create(order_id: @order.id,
													product_id: ci.product.id,
													price: ci.product.price,
													number: ci.number)
			end
				Shipping.create(customer_id: current_customer.id,
											postal_code: @order.postal_code,
											address: @order.address,
											name: @order.name) if @order.select == "3"

			@cart_items.destroy_all

			redirect_to orders_complete_path
		else
			redirect_back(fallback_location: products_path)
		end
	end

	def complete
	end

	def index
		@orders = Order.where(customer_id: current_customer.id)
		@order = Order.new
	end

	def show
		@order = Order.find(params[:id])
	end

	private
	def order_params
		params.require(:order).permit(:postal_code, :address, :name, :payment, :select).merge(customer_id: current_customer.id)
	end
end

