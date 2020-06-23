class Admin::OrderDetailsController < ApplicationController
	before_action :authenticate_admin_administrator!

	def update
		@order_detail = OrderDetail.find(params[:id])
		@order = @order_detail.order
		@order_detail.update(order_detail_params)
		if @order.order_details.any?{|od|od.production_status == "製作中" }
		@order.update(status: "製作中")
		end
		if @order.order_details.all?{|od|od.production_status  == "製作完了"}
		@order.update(status: "発送準備中")
		end
		redirect_back(fallback_location: admin_orders_path)
	end

	private

	def order_detail_params
		params.require(:order_detail).permit(:production_status)
	end
end