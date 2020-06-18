class ShippingsController < ApplicationController
	def new
		@shipping = Shipping.new
		@shippings = Shipping.all
	end
	def create
		@shipping = Shipping.new(shipping_params)
		@shipping.customer_id = current_customer.id
		@shipping.save
		redirect_to new_shipping_path
	end

	def edit
		@shipping = Shipping.find(params[:id])
	end
	def update
		@shipping = Shipping.find(params[:id])
		if @shipping.update(shipping_params)
			redirect_to new_shipping_path
			#引数に(@shipping)とかを入れるのでしょうか？
		else
			render 'edit'
		end
	end
	def destroy
		@shipping = Shipping.find(params[:id])
		@shipping.destroy
		redirect_to new_shipping_path
	end

	private

	def shipping_params
		params.require(:shipping).permit(:postal_code,:address,:name)
	end
end
