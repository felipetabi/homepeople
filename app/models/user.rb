class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :service, dependent: :destroy
  has_many :schedules, through: :service
  has_one :working_setting, dependent: :destroy
  has_many :bookings, foreign_key: "client_id", dependent: :destroy
  # has_many :client_chats, foreign_key: "client_id", dependent: :destroy
  has_many :notifications, as: :notificable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  enum role: %w{user service_client}


  def full_name
    self.first_name + " " + self.last_name
  end

end
