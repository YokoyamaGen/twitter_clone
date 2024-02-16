# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_recommended_tweets, only: %i[new create]

  def new
    @new_tweet = Tweet.new
  end

  def create
    @new_tweet = current_user.tweets.build(tweet_params)
    if @new_tweet.save
      redirect_to tweets_path, notice: 'ツイートを投稿しました'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet, :tweet_image)
  end

  def fetch_recommended_tweets
    @recommended_tweets = Tweet.recent_with_user.page(params[:page])
  end
end
