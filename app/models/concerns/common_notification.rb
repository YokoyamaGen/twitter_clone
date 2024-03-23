# frozen_string_literal: true

module CommonNotification
  extend ActiveSupport::Concern

  included do
    def send_notification
      notification = Notification.create!(user_id: tweet.user_id, event_id: id, event_type: self.class.name)

      action = if notification.event_type == 'Retweet'
                 'ポストをリツイートしました'
               elsif notification.event_type == 'Comment'
                 'ポストにコメントしました'
               else
                 'ポストにいいねしました'
               end

      NotificationMailer.send_mail(action, user_email, user_name).deliver_now
    end
  end

  def user_email
    tweet.user.email
  end

  def user_name
    notification.event.user.name
  end
end
