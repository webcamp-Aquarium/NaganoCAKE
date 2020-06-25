class SearchController < ApplicationController
  before_action :authenticate_admin_administrator!
  layout 'admin'
  def search
    if !Customer.search(params[:search]).blank?
      # カスタマーで検索がヒットした場合
      @customers = Customer.search(params[:search])
    elsif !Product.search(params[:search]).blank?
      # 商品で検索がヒットした場合
      @products = Product.search(params[:search])
    end
  end
end
