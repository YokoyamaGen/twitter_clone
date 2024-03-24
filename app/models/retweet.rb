# frozen_string_literal: true

class Retweet < ApplicationRecord
  include CommonNotification

  belongs_to :user
  belongs_to :tweet

  validates :user_id, presence: true
  validates :tweet_id, presence: true

  scope :recent, -> { order(created_at: :desc) }

  has_one :notification, as: :event, dependent: :destroy

  after_create_commit :send_notification
end
