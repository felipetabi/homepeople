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
    @chat = Chat.find(params[:chat_id])
    booking = @chat.booking
    booking = Booking.update(confirm_service: "true")
    render json: {hola: "hola felipe"}
  end

  def confirm_client
    @chat = Chat.find(params[:chat_id])
    booking = @chat.booking
    booking = Booking.update(confirm_client: "true")
    render json: {hola: "hola felipe"}

  end

  
end