class Chat < ApplicationRecord
  has_many :notifications, as: :notificable, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :booking
  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :service_client, class_name: "User", foreign_key: "service_client_id"



end
