class Schedule < ApplicationRecord
  has_one :booking_schedule, dependent: :destroy
  has_one :booking, through: :booking_schedule, dependent: :destroy
  has_many :notifications, as: :notificable, dependent: :destroy
  belongs_to :service

  after_create :notification_message

  def title
    "Servicio #{self.service.title}"
  end

  def start
    DateTime.parse(self.start_date.strftime("%Y-%m-%dT%H:%M%z"))
  end

  def end
    DateTime.parse((self.start_date+1.hour).strftime("%Y-%m-%dT%H:%M%z"))
  end

  def notification_message
    current_user = self.service.user
    notify = self.notifications.create(message:"haz creado un calendario", state: false, sender_id: current_user.id, receiver_id: current_user.id)
    ActionCable.server.broadcast("user_#{current_user.id}", { message: notify.message })
  end

end
