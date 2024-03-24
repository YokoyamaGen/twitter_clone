# frozen_string_literal: true

module NotificationsHelper
  def fetch_page(event_type)
    if event_type == 'Retweet'
      'retweet'
    elsif event_type == 'Comment'
      'comment'
    else
      'favorite'
    end
  end
end
