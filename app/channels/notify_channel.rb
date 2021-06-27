class NotifyChannel < ApplicationCable::Channel
  def subscribed
    stream_from  "user_#{current_user.id}"
    current_user.update(is_connected: true)
  end

  def unsubscribed
    current_user.update(is_connected: false)
  end
end