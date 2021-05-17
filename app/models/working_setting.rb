class WorkingSetting < ApplicationRecord
  belongs_to :user


  before_create :remove_empty_string, :create_schedules
  before_update :remove_empty_string, :update_schedules


  def remove_empty_string
    self.array_days.compact_blank
    self.array_hours.compact_blank
  end

  def create_schedules
    service = self.user.service
      (self.start_date.to_date..self.end_date.to_date).each do |date|
        self.array_days.compact_blank.each do |day|
          if return_integer_day(day) == date.wday
            (array_hours.compact_blank).each do |hour|
              service.schedules.create(day: date, hour: hour, price: self.hour_price, is_closed: false)
            end
          end

        end
      end
  end

  def update_schedules
    self.user.service.schedules.left_outer_joins(:bookings).destroy_all
    create_schedules
  end


  def return_integer_day(day)
    case day
    when "lunes"
      1
    when "martes"
      2
    when "miercoles"
      3
    when "jueves"
      4
    when "viernes"
      5
    when "sabado"
      6
    when "domingo"
      0
    end
  end

  def self.get_hours
    array_hours = []
    24.times do |n|
      number = sprintf('%02d' ,n)
      array_hours << number+":00"
    end
    array_hours
  end

  def self.get_days
    ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"]
  end

end
