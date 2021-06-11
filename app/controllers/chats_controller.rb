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
    
  end

  
end