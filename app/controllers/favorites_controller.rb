class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(list: List.find(params[:list]), user: current_user)
    puts params
    if favorite == []
      favorite.create(list: List.find(params[:list]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
    end
    respond_to :js, :html
  end
end
