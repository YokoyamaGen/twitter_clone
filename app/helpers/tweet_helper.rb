# frozen_string_literal: true

module TweetHelper
  def fetch_follower_tweets
    Tweet.follower_tweets(current_user).page(params[:page]).with_attached_tweet_image
  end
end
