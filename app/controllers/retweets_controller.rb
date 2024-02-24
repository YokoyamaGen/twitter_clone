# frozen_string_literal: true

class RetweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.retweets.create!(tweet_id: params[:tweet_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    retweet = current_user.retweets.find_by!(tweet_id: params[:tweet_id])
    retweet.destroy!
    redirect_back fallback_location: root_path
  end
end
