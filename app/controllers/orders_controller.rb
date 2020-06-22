class OrdersController < ApplicationController

	def new
	end

	def confirm
	end

	def create
	end

	def complete
	end

	def index
		@orders = Order.where(customer_id: current_customer.id)
		@order = Order.new
	end

	def show
		@order = Order.find(params[:id])
		order_history = @order.order_details.new
		order_history.customer_id = current_customer.id

		if current_customer.order_details.exists?(order_id: "#{params[:id]}")
			old_order_history = current_customer.order_details.find_by(order_id: "#{params[:id]}")
			old_order_history.destroy
		end
		order_history.save

		historys_stock_limit = 20
		historys = current_customer.order_details.all
		if historys.count > historys_stock_limit
			historys[0].destroy
		end
	end

	private

	def order_params
		params.require(:order).permit(:postal_code, :address, :name, :payment).merge(customer_id: current_customer.id)
	end
end
