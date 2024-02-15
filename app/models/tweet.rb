# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :tweet, length: { maximum: 140 }, presence: true

  has_one_attached :tweet_image

  scope :recent, -> { order(created_at: :desc) }

  scope :recent_with_user, -> { recent.includes(:user).with_attached_tweet_image }

  def self.follower_tweets(user)
    follower_ids = user.followers.ids
    where('user_id IN (?)', follower_ids).includes(:user)
  end
end
