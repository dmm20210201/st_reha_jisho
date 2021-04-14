class FavoritesController < ApplicationController
  def create
    @rehabilitation = Rehabilitation.find(params[:rehabilitation_id])
    favorite = current_user.favorites.new(rehabilitation_id: @rehabilitation.id)
    favorite.save
  end

  def destroy
    @rehabilitation = Rehabilitation.find(params[:rehabilitation_id])
    favorite = current_user.favorites.find_by(rehabilitation_id: @rehabilitation.id)
    favorite.destroy
  end
end
