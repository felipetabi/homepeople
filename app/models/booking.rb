class Booking < ApplicationRecord
  belongs_to :schedule
  belongs_to :client, class_name: "User", foreign_key: "client_id"
end
