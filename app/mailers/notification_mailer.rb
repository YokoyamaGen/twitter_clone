# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def send_mail(action, send_email, from_user)
    @action = action
    @from_user = from_user
    mail(
      subject: 'Xクローンからの通知',
      from: ENV['SEND_MAIL'],
      to: send_email
    )
  end
end
