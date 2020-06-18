class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
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
