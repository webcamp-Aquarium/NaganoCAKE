class SearchController < ApplicationController
  def search
    if !Product.search(params[:search]).blank?
      # 商品で検索がヒットした場合
      @products = Product.search(params[:search])
    end
  end
end
