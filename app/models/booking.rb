class Booking < ApplicationRecord
  has_many :booking_schedules, dependent: :destroy
  has_many :schedules, through: :booking_schedules, dependent: :destroy
  has_many :notifications, as: :notificable, dependent: :destroy
  has_one :chat, dependent: :destroy
  has_one :comment, dependent: :destroy
  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :service
  has_one :user, through: :service
  enum status: [:open, :pending, :cancel, :acepted]
  delegate  :description, :region, :comuna, :last_job, :start_date_last_job,
            :end_date_last_job, :description_last_job, :categories_text,
            :address_last_job, to: :service, prefix: true

  delegate :email, :full_name , :role, to: :client, prefix: true
  delegate :email, :full_name , :role, to: :user, prefix: true

  after_create :create_a_chat

  def create_a_chat
    if self.chat.nil?
      self.chat.create(client_id: self.client_id, service_client_id: self.service.user.id)
      notify = self.notifications.create(message:"Te han realizado una reserva", state: false, sender_id: self.client_id, receiver_id: self.service.user.id)
      ActionCable.server.broadcast("user_#{self.service.user.id}", { message: notify.message })
    end
  end

end
