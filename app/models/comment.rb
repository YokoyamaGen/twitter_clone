# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :tweet_id, presence: true

  scope :recent, -> { order(created_at: :desc) }

  delegate :name, to: :user, prefix: true
end
