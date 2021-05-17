class Schedule < ApplicationRecord
  has_many :bookings
  belongs_to :service

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

end
