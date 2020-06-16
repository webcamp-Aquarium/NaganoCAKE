class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def leave
  end

  def hide
  end
end
