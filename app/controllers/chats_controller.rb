class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, except: [:show]

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
    @chat.booking.update(confirm_service: true)
    render json: {response: true}
  end

  def confirm_client
    @chat.booking.update(confirm_client: true)
    render json: {response: true}
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

end