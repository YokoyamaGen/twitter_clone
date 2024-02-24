# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :user_id, presence: true
  validates :tweet_id, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
