class Schedule < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :notifications, as: :notificable
  belongs_to :service

  after_create :notification_message

  def title
    "Servicio #{self.service.title}"
  end

  def start
    now = self.day.to_datetime
    hour = self.hour
    DateTime.parse(now.strftime("%Y-%m-%dT#{hour}:00%z"))
  end

  def end
    now = self.day.to_datetime
    hour = self.hour.split(":").first.to_i + 1
    hour = sprintf('%02d' ,hour) + ":00"
    DateTime.parse(now.strftime("%Y-%m-%dT#{hour}:00%z"))
  end
  
  def notification_message
    current_user = self.service.user
    notify = self.notifications.create(message:"haz creado un calendario", state: false, sender_id: current_user.id, receiver_id: current_user.id)
    ActionCable.server.broadcast("user_#{current_user.id}", { message: notify.message })
  end

end
