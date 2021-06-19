module ChatHelper

  def left_or_right_chat(message, current_user)
    if message.sender == current_user
      "right"
    else
      "left"
    end
  end

  def name_user(message, current_user)
    if message.sender == current_user
      current_user.full_name
    else
      message.receiver.full_name
    end
  end

end
