# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmark = current_user.bookmarks.includes(:tweet).recent
  end

  def create
    current_user.bookmarks.create!(tweet_id: params[:tweet_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    retweet = current_user.bookmarks.find_by!(tweet_id: params[:tweet_id])
    retweet.destroy!
    redirect_back fallback_location: root_path
  end
end
