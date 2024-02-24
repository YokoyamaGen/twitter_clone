# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_back fallback_location: root_path
  end

  def destroy
    followed_user = Follow.find_by(followed_id: params[:user_id]).followed
    current_user.unfollow(followed_user)
    redirect_back fallback_location: root_path
  end
end
