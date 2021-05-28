class NotifyChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #puts "\n\n Pipe  \n\n"
    #puts "\n\n #{ current_user }\n\n"
    #puts "\n\n fjasjfaskfl \n\n"
    stream_from  current_user
    

    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
