class FavoritesController < ApplicationController
  def create
    @closet = Closet.find(params[:closet_id])
    @favorite = Favorite.create(user_id: current_user.id, closet_id: @closet.id)
    
    if @favorite.save
      render :favorite
    end
  end
end
