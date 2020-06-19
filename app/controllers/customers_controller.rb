class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def leave
  end

  def hide
    if @customer.update(is_status: false)
      redirect_to root_path, notice: "退会処理が完了しました。ご利用ありがとうございました。"
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name_kanji,
                                              :first_name_kanji,
                                              :family_name_kana,
                                              :first_name_kana,
                                              :email,
                                              :postal_code,
                                              :address,
                                              :phone,
                                              :is_status)
  end

  def correct_customer
    @customer = Customer.find(params[:id])
    unless current_customer.id == @customer.id
      redirect_to customer_path(current_customer)
    end
  end
end
