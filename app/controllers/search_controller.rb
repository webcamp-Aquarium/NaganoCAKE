class SearchController < ApplicationController
  def search
    @genres = Genre.where(is_status: true)
    @products = Product.search(params[:search]).where(is_status: true,genre_id: @genres)
  end
end
