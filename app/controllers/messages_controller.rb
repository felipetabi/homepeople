class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = Booking.find(params[:booking_id])
    @chat = @booking.chat
    @message = @chat.messages.new(message_params.merge(sender_id: current_user.id, receiver_id: @chat.service_client_id ))
    # binding.pry
    if @message.save

      partial = ApplicationController.render(partial: @chat.messages, locals:{current_user: current_user})
      ActionCable.server.broadcast("chat_channel_#{@booking.id}", partial)

      # ChatChannel.broadcast_to("chat_channel_#{@booking.id}", {
      #   body: ApplicationController.render(@chat.messages, locals:{current_user: current_user}, layout: false)
      # })
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end


end