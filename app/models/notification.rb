class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit :broadcast_to_recipient

  def broadcast_to_recipient
    # broadcast_append_later_to(
    #   recipient,
    #   :notifications,
    #   # target: 'notification-count',
    #   # partial: 'notifications/notification',
    #   count: Notification.count,
    #   locals: {
    #     notification: self
    #   }
    # )

    NotificationsChannel.broadcast_to(
      self,
      {count: Notification.count}
    )
    raise
  end
end
