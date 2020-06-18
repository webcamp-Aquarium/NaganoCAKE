class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def full_name(resource)
    resource.family_name_kanji + resource.first_name_kanji
  end
end
