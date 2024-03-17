# frozen_string_literal: true

module MessageHelper
  def fetch_user
    user_room_ids = current_user.user_rooms.pluck(:room_id)
    other_user_ids = UserRoom.where(room_id: user_room_ids).where.not(user_id: current_user.id).pluck(:user_id)
    User.where(id: other_user_ids)
  end
end
