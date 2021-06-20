class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel_#{params[:booking_id]}" if params[:booking_id].present?
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end

  # def speak(data)
  #   ActionCable.server.broadcast "room_channel", message: data['message']
  # end

end
