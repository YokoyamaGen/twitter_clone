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

      NotificationMailer.send_mail(action, tweet.user.email, notification.event.user.name).deliver_now
    end
  end
end
