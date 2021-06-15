class ChatsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chat = Chat.find(params[:id])
    if current_user == @chat.client || current_user == @chat.service_client
      @messages = @chat.messages
      @booking = @chat.booking
    else
      redirect_to root_path alert: "No permitido entrar a este chat"
    end
  end

  def confirm_service
    æchat = Chat.find(params[:chat_id])
    render json: {hola: "hola felipe"}
    #æchat = current_user.chat.booking(params(confirm_service:true))
    booking = æchat.booking
    booking = Booking.update(confirm_service: "true")
  end

  
end