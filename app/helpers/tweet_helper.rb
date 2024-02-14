# frozen_string_literal: true

module TweetHelper
  def fetch_recommended_tweets
    Tweet.recent.includes(:user).page(params[:page]).with_attached_tweet_image
  end

  def fetch_follower_tweets
    Tweet.follower_tweets(current_user).page(params[:page]).with_attached_tweet_image
  end
end
