# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :content, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
