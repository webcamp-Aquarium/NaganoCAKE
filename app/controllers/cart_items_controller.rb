class CartItemsController < ApplicationController

  def index
  end

  def create
    @cart_item = current_customer.cart_items.new(product_id: params[:product_id],
                                                number: params[:cart_item][:number])
    if @cart_item.save
      redirect_to root_path
    else
      @genres = Genre.where(is_status: true)
      @products = Product.find(params[:product_id])
      render 'products/show'
    end
  end

  def destroy
  end

  def update
  end

  def reset
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id,:product_id,:number)
  end

  def number_params
    params.require(:number).permit(:number)
  end

end
