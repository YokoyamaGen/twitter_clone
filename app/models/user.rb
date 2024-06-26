# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  DEFAULT_BIRTHDAY = '19900101'
  DEFAULT_TELEPHONE_NUMBER = '080111112222'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, omniauth_providers: %i[github]
  has_many :authorizations, dependent: :destroy

  has_many :user_followers, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower

  has_many :followed_users, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed
  has_many :all_followed, through: :user_followers, source: :followed
  has_many :all_followers, through: :followed_users, source: :follower

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many :user_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_one_attached :icon_image
  has_one_attached :header_image

  has_many :notifications, dependent: :destroy

  def self.from_omniauth(auth)
    authorization = Authorization.find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    authorization.assign_attributes(name: auth.info.name, email: auth.info.email)

    where(email: auth.info.email).first_or_initialize.tap do |user|
      password = Devise.friendly_token[0, 20]
      user.assign_attributes(name: auth.info.name, password:, password_confirmation: password,
                             confirmed_at: Time.zone.now, birthday: DEFAULT_BIRTHDAY,
                             telephone_number: DEFAULT_TELEPHONE_NUMBER)
      user.save!
      user.authorizations << authorization unless user.authorizations.exists?(provider: auth.provider, uid: auth.uid)
    end
  end

  def already_liked?(like)
    like.pluck(:user_id).include?(id)
  end

  def already_retweeted?(retweet)
    retweet.pluck(:user_id).include?(id)
  end

  def follow(other)
    all_followed << other
  end

  def unfollow(other)
    user_followers.find_by(followed_id: other.id).destroy
  end

  def already_followed?(followed_user)
    all_followed.include?(followed_user)
  end

  def already_bookmarked?(bookmark)
    bookmark.pluck(:user_id).include?(id)
  end
end
