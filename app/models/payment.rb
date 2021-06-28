class Payment < ApplicationRecord
  belongs_to :user

  scope :check_expired_at?, -> { where("expired_at > ?", DateTime.now).count > 0 }

  enum kind: [:internal_client, :external_client]
  
end
