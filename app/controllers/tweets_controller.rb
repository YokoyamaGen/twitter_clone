# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @new_tweet = Tweet.new
    @recommended_tweets = Tweet.all.order(created_at: :desc).includes(:user).page(params[:page])
    follower_ids = current_user.followers.map(&:id)
    @follower_tweets = Tweet.where('user_id IN (?)', follower_ids).includes(:user).page(params[:page])
  end
end
