# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :event, polymorphic: true

  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :event_type, presence: true
end
