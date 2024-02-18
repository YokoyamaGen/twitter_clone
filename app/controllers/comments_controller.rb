# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @new_comment = current_user.comments.build(comment_params)
    if @new_comment.save
      redirect_back fallback_location: root_path, notice: '返信を投稿しました'
    else
      redirect_back fallback_location: root_path, alert: '返信の投稿に失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(tweet_id: params[:tweet_id])
  end
end
