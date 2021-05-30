class BookingSchedule < ApplicationRecord
  belongs_to :booking
  belongs_to :schedule
end
