class NotifyChannel < ApplicationCable::Channel
  def subscribed
    stream_from  "user_#{current_user.id}"
    # ActionCable.server.broadcast(current_user, { message: "Hola #{ current_user.email }" })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
#<User:0x00007f591c0109b0>
#<User:0x0000560f420576c8>