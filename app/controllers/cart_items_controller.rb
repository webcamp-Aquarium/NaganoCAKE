class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :cart_items_all,only: [:index,:destroy,:update,:reset]

  def index
  end

  def create
    @cart_item = current_customer.cart_items.new(product_id: params[:product_id],
                                                number: params[:cart_item][:number])
    if @cart_item.save
      redirect_to cart_items_path
    else
      @genres = Genre.where(is_status: true)
      @products = Product.find(params[:product_id])
      render 'products/show'
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      # redirect_back(fallback_location: root_path)
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      # redirect_back(fallback_location: root_path)
    end
  end

  def reset
    if @cart_items.destroy_all
      redirect_to products_path, notice: "カートを空にしました。"
    else
      render :index ,notice: "カートを空にできませんでした。"
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id,:product_id,:number)
  end

  def cart_items_all
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end
end
