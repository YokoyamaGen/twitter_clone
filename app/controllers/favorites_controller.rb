# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    current_user.favorites.create!(tweet_id: params[:tweet_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    favorite = current_user.favorites.find_by!(tweet_id: params[:tweet_id])
    favorite.destroy!
    redirect_back fallback_location: root_path
  end
end
