# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!, :set_used_room

  def show
    room = Message.check_used_room(current_user, @used_room, @other_user)

    @messages = room.messages.order(:created_at)
    @new_message = room.messages.new
  end

  def create
    @message = current_user.messages.create!(room_id: @used_room.room_id, content: params[:message][:content])
  end

  private

  def set_used_room
    @other_user = User.find(params[:user_id])
    room_ids = current_user.user_rooms.pluck(:room_id)
    @used_room = UserRoom.find_by(user_id: @other_user, room_id: room_ids)
  end
end
