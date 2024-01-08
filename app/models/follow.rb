# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', inverse_of: :user_followers
  belongs_to :followed, class_name: 'User', inverse_of: :followed_users
end
