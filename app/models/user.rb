class User < ApplicationRecord
  paginates_per 50
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :service, dependent: :destroy
  has_many :schedules, through: :service
  has_one :working_setting, dependent: :destroy
  has_many :bookings, foreign_key: "client_id", dependent: :destroy
  # has_many :client_chats, foreign_key: "client_id", dependent: :destroy
  has_many :notifications, as: :notificable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_one_attached :photo

  enum role: [:user, :service_client, :admin]
  enum gender: [:masculino, :femenino]

  def full_name
    self.first_name + " " + self.last_name
  end

  def check_if_payments?
    !self.payments.empty? && self.payments.check_expired_at?
  end

end
