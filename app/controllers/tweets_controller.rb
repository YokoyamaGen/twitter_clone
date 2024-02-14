# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @new_tweet = Tweet.new
  end

  def create
    @new_tweet = Tweet.new(tweet_params)
    if @new_tweet.save
      redirect_to tweets_path, notice: 'ツイートを投稿しました'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet, :tweet_image).merge(user_id: current_user.id)
  end
end
