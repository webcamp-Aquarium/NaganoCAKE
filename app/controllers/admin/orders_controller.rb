class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin_administrator!
	layout 'admin'
	def index
		@orders = Order.page(params[:page]).reverse_order
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		if @order.status == "入金確認"
		@order.order_details.update_all(production_status: "製作待ち")
		end
		redirect_back(fallback_location: admin_order_path(@order))
	end

	private

	def order_params
		params.require(:order).permit(:status)
	end
end
