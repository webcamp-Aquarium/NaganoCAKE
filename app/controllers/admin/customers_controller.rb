class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin_administrator!
  before_action :find_customer,only: [:show,:edit,:update]

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customers_path
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

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
