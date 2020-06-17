class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def leave
  end

  def hide
    @customer = Customer.find(params[:id])
    if @customer.update(is_status: false)
      redirect_to root_path
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
end
