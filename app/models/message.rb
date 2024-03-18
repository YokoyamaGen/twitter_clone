# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :content, presence: true

  def self.check_used_room(current_user, used_room, other_user)
    return used_room.room if used_room

    room = Room.create
    current_user.user_rooms.create!(room_id: room.id)
    other_user.user_rooms.create!(room_id: room.id)
    room
  end
end
