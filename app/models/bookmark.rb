# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :user_id, presence: true
  validates :tweet_id, presence: true
  validates :tweet_id, uniqueness: { scope: :user_id }

  scope :recent, -> { order(created_at: :desc) }
end
