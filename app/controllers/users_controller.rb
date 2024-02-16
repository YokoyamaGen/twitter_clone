# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path, notice: 'プロフィールを更新しました'
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:icon_image, :header_image, :name, :self_introduction, :location, :website, :birthday)
  end
end
